import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flick_video_player/flick_video_player.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:thichxemphim/boxes.dart';
import 'package:thichxemphim/common/share_color.dart';
import 'package:thichxemphim/models/episode.dart';
import 'package:thichxemphim/models/hive_local/movie_favorite.dart';
import 'package:thichxemphim/screens/movie_detail_screen/controller/movie_detail_controller.dart';
import 'package:thichxemphim/screens/movie_detail_screen/widgets/content_actor.dart';
import 'package:thichxemphim/screens/movie_detail_screen/widgets/content_category.dart';
import 'package:thichxemphim/screens/movie_detail_screen/widgets/title_and_content.dart';
import 'package:thichxemphim/widgets/loading_widget.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class MovieDetailScreen extends StatefulWidget {
  int? indexSelected;
  final String slug;
  MovieDetailScreen({
    super.key,
    required this.slug,
    this.indexSelected,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with AfterLayoutMixin {
  ///
  final _controller = Get.put(MovieDetailController());

  //
  late FlickManager flickManager;
  late String _videoURL;
  int indexSelected = 0;
  //
  bool isHidden = false;
  bool isCheckHidden = true;
  List<String> items = [];
  List<String> beginningOfContent = [];
  String summaryContent = '';
  //

  //
  void splitContent() {
    // làm chức năng chia nhỏ content để hiện 1 phần
    items = _controller.movie.value!.content!.split(' ');
    if (items.length >= 50) {
      isCheckHidden = false;
      isHidden = true;
      for (var i = 0; i < 35; i++) {
        beginningOfContent.add(items[i]);
      }
      summaryContent = beginningOfContent.join(' ');
      summaryContent = '$summaryContent ...';
    }
  }

  Future<bool?> toggleFavorite({required bool isFavorite}) async {
    //
    final movie = MovieFavorite(
      name: _controller.movie.value!.name,
      poster_url: _controller.movie.value!.poster_url,
      slug: widget.slug,
      indexSelected: indexSelected,
    );

    if (isFavorite) {
      await boxFavorites.delete('key${widget.slug}');
    } else {
      await boxFavorites.put('key${widget.slug}', movie);
    }

    // Trả về giá trị boolean mới
    return !isFavorite;
  }

  void playNewVideo(FlickManager flickManager, String url) {
    setState(() {
      flickManager.handleChangeVideo(
        VideoPlayerController.networkUrl(
          Uri.parse(url),
        ),
      );
    });
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    if (widget.indexSelected != null) {
      indexSelected = widget.indexSelected!;
    }
    await _controller.getMovieDetail(slug: widget.slug).then((_) async {
      _videoURL = _controller.episodes.value[indexSelected]!.link_m3u8!;
      flickManager = FlickManager(
        autoPlay: true,
        autoInitialize: true,
        videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(_videoURL),
        ),
      );
    });
    splitContent();
  }

  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final isFavorite = boxFavorites.get('key${widget.slug}') != null;
    return Scaffold(
      //appBar: AppBar(),
      body: _buildBody(height, context, isFavorite),
    );
  }

  Widget _buildBody(double height, BuildContext context, bool isFavorite) {
    return SafeArea(
      child: Obx(
        () {
          if (_controller.isLoading.value) {
            return LoadingWidget();
          }
          return Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: height * 0.3,
                    child: FlickVideoPlayer(
                      flickManager: flickManager,
                      wakelockEnabled: true,
                      flickVideoWithControls: FlickVideoWithControls(
                        aspectRatioWhenLoading: 16 / 9,
                        videoFit: BoxFit.fill,
                        controls: FlickPortraitControls(
                          iconSize: 40,
                          progressBarSettings: FlickProgressBarSettings(
                            playedColor: Colors.blue,
                          ),
                        ),
                        playerLoadingFallback: const LoadingWidget(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ShareColors.kPrimaryColor,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    //top: 10,
                  ),
                  height: height - (height * 0.3 + 32),
                  child: SingleChildScrollView(
                    //physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _controller.movie.value?.name ?? '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 10),
                              LikeButton(
                                isLiked: isFavorite,
                                size: 30,
                                onTap: (isFavorite) => toggleFavorite(
                                  isFavorite: isFavorite,
                                ),
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isLiked ? Colors.red : Colors.grey,
                                    size: 30,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        _controller.episodes.value.length == 1
                            ? const SizedBox()
                            : _buildEpisode(
                                _controller.episodes.value,
                                flickManager,
                                isFavorite,
                              ),
                        SizedBox(height: 10),
                        TitleAndContent(
                          title: 'Nội dung',
                          content: isHidden
                              ? summaryContent
                              : _controller.movie.value!.content ?? '',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        isCheckHidden
                            ? const SizedBox()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isHidden = !isHidden;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: ShareColors.kPrimaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        isHidden ? 'Xem thêm' : 'Rút gọn',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                        SizedBox(height: 10),
                        ContentActor(
                          items: _controller.movie.value!.actor ?? [],
                        ),
                        SizedBox(height: 10),
                        ContentCategory(
                          items: _controller.movie.value!.category ?? [],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildEpisode(
    List<Episode?> items,
    FlickManager flickManager,
    bool isFavorite,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tập phim: ',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () async {
              if (indexSelected != index) {
                setState(() {
                  indexSelected = index;
                });
                playNewVideo(
                  flickManager,
                  items[index]!.link_m3u8 ?? '',
                );
              }
              if (isFavorite) {
                final movie = MovieFavorite(
                  name: _controller.movie.value!.name,
                  poster_url: _controller.movie.value!.poster_url,
                  slug: widget.slug,
                  indexSelected: indexSelected,
                );
                await boxFavorites.put('key${widget.slug}', movie);
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: indexSelected == index
                    ? ShareColors.kPrimaryColor
                    : Colors.grey,
              ),
              child: indexSelected == index
                  ? ProgressWidget()
                  : Text(
                      (items[index]!.name ?? '').replaceFirst('Tập', '').trim(),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
