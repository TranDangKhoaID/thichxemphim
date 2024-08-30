import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thichxemphim/locator.dart';

import 'package:thichxemphim/models/movie.dart';
import 'package:thichxemphim/repositories/data_repository.dart';

class MoviesNuController extends GetxController {
  /// MARK: - Initials;
  Rx<List<Movie>> movies = Rx<List<Movie>>([]);
  RxInt totalPages = 0.obs;
  RxBool isLoading = false.obs;
  final dataRepository = locator<DataRepository>();

  //
  Future<void> getMovies({
    required int page,
  }) async {
    try {
      isLoading.value = true;
      final response = await dataRepository.getMoviesNewUpdate(
        slug: 'phim-moi-cap-nhat',
        page: page,
      );
      final items = response.items ?? [];
      totalPages.value = response.pagination?.totalPages ?? 0;
      movies.value = items;
    } catch (e) {
      debugPrint('Get movies error ==> $e');
    } finally {
      isLoading.value = false;
    }
  }
}
