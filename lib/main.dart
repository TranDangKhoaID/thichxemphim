import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:thichxemphim/boxes.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/models/hive_local/movie_favorite.dart';
import 'package:thichxemphim/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //hive
  await Hive.initFlutter();
  Hive.registerAdapter(MovieFavoriteAdapter());
  boxFavorites = await Hive.openBox<MovieFavorite>('favorites');
  //di
  configureDependencies();
  runApp(const MyApp());
}
