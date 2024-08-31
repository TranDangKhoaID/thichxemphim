import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/models/movie.dart';
import 'package:thichxemphim/repositories/data_repository.dart';

class MoviesController extends GetxController {
  /// MARK: - Initials;
  Rx<List<Movie>> movies = Rx<List<Movie>>([]);
  RxBool isLoading = false.obs;
  final dataRepository = locator<DataRepository>();

  //
  Future<void> getMovies({
    required int page,
    required String slug,
  }) async {
    try {
      isLoading.value = true;
      final response = await dataRepository.getMovies(
        slug: slug,
        page: page,
      );
      final items = response.data!.items ?? [];
      movies.value = items;
    } catch (e) {
      debugPrint('Get movies error ==> $e');
    } finally {
      isLoading.value = false;
    }
  }
}
