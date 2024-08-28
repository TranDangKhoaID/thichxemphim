import 'package:flutter/material.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //di
  configureDependencies();
  runApp(const MyApp());
}
