import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/models/episode.dart';
import 'package:thichxemphim/models/movie_detail.dart';
import 'package:thichxemphim/repositories/data_repository.dart';

class MovieDetailController extends GetxController {
  /// MARK: - Initials;
  final dataRepository = locator<DataRepository>();
  RxBool isLoading = true.obs;
  Rx<MovieDetail?> movie = Rx<MovieDetail?>(null);
  Rx<List<Episode?>> episodes = Rx<List<Episode?>>([null]);

  @override
  onInit() {
    super.onInit();
  }

  //get movie
  Future<void> getMovieDetail({
    required String slug,
  }) async {
    try {
      isLoading.value = true;
      final response = await dataRepository.getMovieDetail(slug: slug);
      movie.value = response.movie;
      episodes.value = response.episodes![0].server_data ?? [];
    } catch (e) {
      debugPrint('Get movies error ==> $e');
    } finally {
      isLoading.value = false;
    }
  }

  //
}
