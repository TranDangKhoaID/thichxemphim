import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/models/movie.dart';
import 'package:thichxemphim/repositories/data_repository.dart';

class HomeController extends GetxController {
  /// MARK: - Initials;
  final dataRepository = locator<DataRepository>();
  //
  Rx<List<List<Movie>>> movies = Rx<List<List<Movie>>>([[], [], [], [], []]);
  Rx<List<int>> totalPages = Rx<List<int>>([0, 0, 0, 0, 0]);
  Rx<List<bool>> isLoadings = Rx<List<bool>>([
    false,
    false,
    false,
    false,
    false,
  ]);
  //
  Future<List<Movie>> searchMovies({
    required String name,
  }) async {
    try {
      final response = await dataRepository.searchMovies(name: name);
      return response.data!.items ?? [];
    } catch (e) {
      debugPrint('Get search movies error $e');
      return [];
    }
  }

  //
  Future<void> getNewUpdateMovies() async {
    try {
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[0] = true;
      isLoadings.value = updatedLoadings;
      final response = await dataRepository.getMoviesNewUpdate(
        slug: 'phim-moi-cap-nhat',
        page: 1,
      );
      // Tạo bản sao mới của danh sách movies và totalPages
      final updatedMovies = List<List<Movie>>.from(movies.value);
      updatedMovies[0] = response.items ?? [];
      movies.value = updatedMovies;

      final updatedTotalPages = List<int>.from(totalPages.value);
      updatedTotalPages[0] = response.pagination?.totalPages ?? 0;
      totalPages.value = updatedTotalPages;
    } catch (e) {
      debugPrint('Get new updates movies error $e');
    } finally {
      // Cập nhật lại isLoadings để thông báo thay đổi
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[0] = false;
      isLoadings.value = updatedLoadings;
    }
  }

  //get movies phim lẻ
  Future<void> getMovieMovies() async {
    try {
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[1] = true;
      isLoadings.value = updatedLoadings;
      final response = await dataRepository.getMovies(
        slug: 'phim-le',
        page: 1,
      );
      // Tạo bản sao mới của danh sách movies và totalPages
      final updatedMovies = List<List<Movie>>.from(movies.value);
      updatedMovies[1] = response.data!.items ?? [];
      movies.value = updatedMovies;

      final updatedTotalPages = List<int>.from(totalPages.value);
      updatedTotalPages[1] = response.data?.params?.pagination?.totalPages ?? 0;
      totalPages.value = updatedTotalPages;
    } catch (e) {
      debugPrint('Get movie movies error $e');
    } finally {
      // Cập nhật lại isLoadings để thông báo thay đổi
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[1] = false;
      isLoadings.value = updatedLoadings;
    }
  }

  //get phim bộ
  Future<void> getMovieTVSeries() async {
    try {
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[2] = true;
      isLoadings.value = updatedLoadings;
      final response = await dataRepository.getMovies(
        slug: 'phim-bo',
        page: 1,
      );
      // Tạo bản sao mới của danh sách movies và totalPages
      final updatedMovies = List<List<Movie>>.from(movies.value);
      updatedMovies[2] = response.data!.items ?? [];
      movies.value = updatedMovies;

      final updatedTotalPages = List<int>.from(totalPages.value);
      updatedTotalPages[2] = response.data?.params?.pagination?.totalPages ?? 0;
      totalPages.value = updatedTotalPages;
    } catch (e) {
      debugPrint('Get movie tv series error $e');
    } finally {
      // Cập nhật lại isLoadings để thông báo thay đổi
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[2] = false;
      isLoadings.value = updatedLoadings;
    }
  }

  //get hoat hinh
  Future<void> getMovieCartoons() async {
    try {
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[3] = true;
      isLoadings.value = updatedLoadings;
      final response = await dataRepository.getMovies(
        slug: 'hoat-hinh',
        page: 1,
      );
      // Tạo bản sao mới của danh sách movies và totalPages
      final updatedMovies = List<List<Movie>>.from(movies.value);
      updatedMovies[3] = response.data!.items ?? [];
      movies.value = updatedMovies;

      final updatedTotalPages = List<int>.from(totalPages.value);
      updatedTotalPages[3] = response.data?.params?.pagination?.totalPages ?? 0;
      totalPages.value = updatedTotalPages;
    } catch (e) {
      debugPrint('Get movie cartoon error $e');
    } finally {
      // Cập nhật lại isLoadings để thông báo thay đổi
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[3] = false;
      isLoadings.value = updatedLoadings;
    }
  }

  //get tv shows
  Future<void> getMovieTVShows() async {
    try {
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[4] = true;
      isLoadings.value = updatedLoadings;
      final response = await dataRepository.getMovies(
        slug: 'tv-shows',
        page: 1,
      );
      // Tạo bản sao mới của danh sách movies và totalPages
      final updatedMovies = List<List<Movie>>.from(movies.value);
      updatedMovies[4] = response.data!.items ?? [];
      movies.value = updatedMovies;

      final updatedTotalPages = List<int>.from(totalPages.value);
      updatedTotalPages[4] = response.data?.params?.pagination?.totalPages ?? 0;
      totalPages.value = updatedTotalPages;
    } catch (e) {
      debugPrint('Get movie tv shows error $e');
    } finally {
      // Cập nhật lại isLoadings để thông báo thay đổi
      final updatedLoadings = List<bool>.from(isLoadings.value);
      updatedLoadings[4] = false;
      isLoadings.value = updatedLoadings;
    }
  }
}
