import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:thichxemphim/boxes.dart';
import 'package:thichxemphim/models/movie_favorite.dart';

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
      body: ValueListenableBuilder(
        valueListenable: boxFavorites.listenable(),
        builder: (context, box, _) {
          return ListView.builder(
            itemCount: boxFavorites.length,
            itemBuilder: (context, index) {
              final MovieFavorite movie = boxFavorites.getAt(index);
              return ListTile(
                title: Text(movie.name ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
