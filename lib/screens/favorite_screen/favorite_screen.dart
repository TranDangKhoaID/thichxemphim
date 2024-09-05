import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:thichxemphim/boxes.dart';
import 'package:thichxemphim/models/movie_favorite.dart';
import 'package:thichxemphim/screens/movie_detail.dart/movie_detail_screen.dart';
import 'package:thichxemphim/widgets/shimmer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phim đã lưu'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  ValueListenableBuilder<Box<dynamic>> _buildBody() {
    return ValueListenableBuilder(
      valueListenable: boxFavorites.listenable(),
      builder: (context, box, _) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.55,
            ),
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final MovieFavorite movie = boxFavorites.getAt(index);
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
                        borderRadius: BorderRadius.circular(5),
                        child: _buildCachedNetWorldImage(movie),
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
            itemCount: boxFavorites.length,
          ),
        );
      },
    );
  }

  Widget _buildCachedNetWorldImage(MovieFavorite movie) {
    return CachedNetworkImage(
      height: 160,
      imageUrl: 'https://phimimg.com/${movie.poster_url}',
      fit: BoxFit.cover,
      placeholder: (context, url) => const ShimmerImage(),
      errorWidget: (context, url, error) => CachedNetworkImage(
        height: 160,
        imageUrl: movie.poster_url ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) => const ShimmerImage(),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
        ),
      ),
    );
  }
}
