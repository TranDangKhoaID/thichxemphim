import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:thichxemphim/common/constants.dart';
import 'package:thichxemphim/controller/network_controller.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/models/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:thichxemphim/screens/home_screen/controller/home_controller.dart';
import 'package:thichxemphim/screens/home_screen/widgets/shimmer_grid_items.dart';
import 'package:thichxemphim/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:thichxemphim/screens/movies_new_update_screen/movies_new_update_screen.dart';
import 'package:thichxemphim/screens/movies_screen/movies_screen.dart';
import 'package:thichxemphim/widgets/loading_widget.dart';
import 'package:thichxemphim/widgets/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AfterLayoutMixin {
  /// MARK: - Initials;
  //final _controller = Get.put(HomeController());
  final _controller = locator<HomeController>();
  final _controllerConnect = Get.find<NetworkController>();
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _controller
      ..getNewUpdateMovies()
      ..getMovieMovies()
      ..getMovieTVSeries()
      ..getMovieCartoons()
      ..getMovieTVShows();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  //
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: _buildAppbar(context),
      body: Obx(
        () => _controllerConnect.isConnected.value
            ? _buildBody()
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off, size: 80),
                    Text('Lỗi kết nối mạng!'),
                  ],
                ),
              ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: !_isSearching
          ? Row(
              children: const [
                SizedBox(height: 10),
                Text(
                  'Xem Phim Vietsub',
                ),
              ],
            )
          : TypeAheadField<Movie>(
              suggestionsCallback: (search) async {
                return await _controller.searchMovies(name: search);
              },
              loadingBuilder: (context) => LoadingWidget(),
              //emptyBuilder: (context) => Text('Hãy nhập tên phim đúng'),
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  autofocus: true,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    hintText: 'Nhập tên phim...',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                );
              },
              itemBuilder: (context, movie) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      width: 80,
                      //height: 80,
                      imageUrl: '${Constants.CND_IMAGE}/${movie.poster_url}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const ShimmerImage(),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                  title: Text(
                    '${movie.name}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(movie.episode_current ?? ''),
                );
              },
              onSelected: (movie) => Get.to(
                () => MovieDetailScreen(slug: movie.slug!),
              ),
            ),
      elevation: 0,
      //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
              // if (!_isSearching) {
              //   _searchController.clear();
              // }
            });
          },
          icon: Icon(
            _isSearching ? Icons.close : Icons.search,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNewUpdateMovies(),
            Divider(),
            Obx(
              () => Column(
                children: [
                  _buildMovies(
                    items: _controller.movies.value[1],
                    isLoading: _controller.isLoadings.value[1],
                    title: 'Phim lẻ',
                    onTap: () => Get.to(
                      () => MoviesScreen(
                        slug: 'phim-le',
                        totalPages: _controller.totalPages.value[1],
                        title: 'Phim lẻ',
                      ),
                    ),
                  ),
                  Divider(),
                  _buildMovies(
                    items: _controller.movies.value[2],
                    isLoading: _controller.isLoadings.value[2],
                    title: 'Phim bộ',
                    onTap: () => Get.to(
                      () => MoviesScreen(
                        slug: 'phim-bo',
                        totalPages: _controller.totalPages.value[2],
                        title: 'Phim bộ',
                      ),
                    ),
                  ),
                  Divider(),
                  _buildMovies(
                    items: _controller.movies.value[3],
                    isLoading: _controller.isLoadings.value[3],
                    title: 'Hoạt hình',
                    onTap: () => Get.to(
                      () => MoviesScreen(
                        slug: 'hoat-hinh',
                        totalPages: _controller.totalPages.value[3],
                        title: 'Hoạt hình',
                      ),
                    ),
                  ),
                  Divider(),
                  _buildMovies(
                    items: _controller.movies.value[4],
                    isLoading: _controller.isLoadings.value[4],
                    title: 'TV - Shows',
                    onTap: () => Get.to(
                      () => MoviesScreen(
                        slug: 'tv-shows',
                        totalPages: _controller.totalPages.value[4],
                        title: 'TV Shows',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNewUpdateMovies() {
    return Obx(() {
      final items = _controller.movies.value[0];
      if (_controller.isLoadings.value[0]) {
        return ShimmerListItems(
          text: 'Phim mới cập nhật',
        );
      }
      if (items.isEmpty) {
        return Center(
          child: Text('Lỗi kết nối'),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Text(
                  'Phim mới cập nhật',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    final totalPages = _controller.totalPages.value[0];
                    Get.to(
                      () => MoviesNewUpdateScreen(
                        totalPages: totalPages,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = items[index];
                return GestureDetector(
                  onTap: () => Get.to(
                    () => MovieDetailScreen(slug: movie.slug!),
                  ),
                  child: Container(
                    width: 120,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            width: 120,
                            height: 160,
                            imageUrl: movie.poster_url ?? '',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const ShimmerImage(),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                            ),
                          ),
                        ),
                        Text(
                          movie.name ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: items.length,
            ),
          ),
        ],
      );
    });
  }

  //
  Widget _buildMovies({
    required List<Movie> items,
    required bool isLoading,
    required String title,
    required void Function() onTap,
  }) {
    if (isLoading) {
      return ShimmerGridItems(
        text: title,
      );
    }
    if (items.isEmpty) {
      return Center(
        child: Text('Lỗi kết nối'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.arrow_forward_ios,
                ),
              )
            ],
          ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.56,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final movie = items[index];
            return GestureDetector(
              onTap: () => Get.to(
                () => MovieDetailScreen(slug: movie.slug!),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        height: 160,
                        imageUrl: 'https://phimimg.com/${movie.poster_url}',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const ShimmerImage(),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                        ),
                      ),
                    ),
                    Text(
                      movie.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: 6,
        ),
      ],
    );
  }
}
