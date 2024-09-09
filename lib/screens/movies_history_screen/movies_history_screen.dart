import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:thichxemphim/boxes.dart';
import 'package:thichxemphim/models/hive_local/movie_history.dart';
import 'package:thichxemphim/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:thichxemphim/widgets/shimmer.dart';

class MoviesHistoryScreen extends StatefulWidget {
  const MoviesHistoryScreen({super.key});

  @override
  State<MoviesHistoryScreen> createState() => _MoviesHistoryScreenState();
}

class _MoviesHistoryScreenState extends State<MoviesHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử xem phim'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  ValueListenableBuilder<Box<dynamic>> _buildBody() {
    return ValueListenableBuilder(
      valueListenable: boxHistories.listenable(),
      builder: (context, box, _) {
        if (boxHistories.isEmpty) {
          return Center(
            child: Text(
              'Bạn chưa xem phim nào',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final MovieHistory movie = boxHistories.getAt(index);
              return GestureDetector(
                onTap: () => Get.to(
                  () => MovieDetailScreen(
                    slug: movie.slug!,
                    //indexSelected: movie.indexSelected,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: _buildCachedNetWorldImage(movie),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              movie.name ?? '',
                              //maxLines: 1,
                              //overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Đang xem : Tập ${movie.indexSelected! + 1}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: boxHistories.length,
          ),
        );
      },
    );
  }

  Widget _buildCachedNetWorldImage(MovieHistory movie) {
    return CachedNetworkImage(
      width: 110,
      imageUrl: 'https://phimimg.com/${movie.poster_url}',
      fit: BoxFit.cover,
      placeholder: (context, url) => const ShimmerImage(),
      errorWidget: (context, url, error) => CachedNetworkImage(
        height: 160,
        imageUrl: movie.poster_url ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) => const ShimmerImage(),
        errorWidget: (context, url, error) => Center(
          child: Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}
