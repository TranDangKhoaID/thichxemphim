import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:thichxemphim/boxes.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/models/hive_local/movie_favorite.dart';
import 'package:thichxemphim/models/hive_local/movie_history.dart';
import 'package:thichxemphim/my_app.dart';
import 'package:thichxemphim/screens/movie_detail_screen/controller/movie_detail_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //hive
  await Hive.initFlutter();
  Hive.registerAdapter(MovieHistoryAdapter());
  Hive.registerAdapter(MovieFavoriteAdapter());
  boxHistories = await Hive.openBox<MovieHistory>('histories');
  boxFavorites = await Hive.openBox<MovieFavorite>('favorites');
  //di
  configureDependencies();
  runApp(const MyApp());
}
