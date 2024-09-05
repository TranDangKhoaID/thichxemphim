import 'package:flutter/material.dart';
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
      body: ListView.builder(
        itemCount: boxFavorites.length,
        itemBuilder: (context, index) {
          final MovieFavorite movie = boxFavorites.getAt(index);
          return ListTile(
            title: Text(movie.name ?? ''),
            leading: IconButton(
              onPressed: () {
                setState(() {
                  boxFavorites.deleteAt(index);
                });
              },
              icon: Icon(
                Icons.remove,
              ),
            ),
          );
        },
      ),
    );
  }
}
