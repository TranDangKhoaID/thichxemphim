import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:thichxemphim/common/share_color.dart';
import 'package:thichxemphim/screens/movies_new_update_screen/controller/movies_nu_controller.dart';

class MoviesNewUpdateScreen extends StatefulWidget {
  final int? totalPages;
  const MoviesNewUpdateScreen({super.key, this.totalPages});

  @override
  State<MoviesNewUpdateScreen> createState() => _MoviesNewUpdateScreenState();
}

class _MoviesNewUpdateScreenState extends State<MoviesNewUpdateScreen>
    with AfterLayoutMixin {
  //
  int _page = 1;
  final _controller = Get.put(MoviesNuController());
  //

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _controller.getMovies(page: _page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          NumberPaginator(
            numberPages: widget.totalPages ?? 10,
            onPageChange: (index) {
              setState(() {
                _page = index + 1;
              });
              _controller.movies.value.clear();
              _controller.getMovies(page: _page);
            },
            config: NumberPaginatorUIConfig(
              buttonSelectedBackgroundColor: ShareColors.kPrimaryColor,
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (_controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (_controller.movies.value.isEmpty) {
                  return Center(child: Text('No movies available'));
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final movie = _controller.movies.value[index];
                    return ListTile(
                      title: Text(movie.name ?? ''),
                      subtitle: Text(movie.year.toString()),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _controller.movies.value.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
