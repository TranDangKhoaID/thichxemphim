import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thichxemphim/locator.dart';
import 'package:thichxemphim/models/movie.dart';
import 'package:thichxemphim/repositories/data_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  /// MARK: - Initials;
  final dataRepository = locator<DataRepository>();
  HomeCubit() : super(HomeState.initial(HomeStateData()));

  /// Get home page
  Future<void> getMoviesNewUpdate({
    int? page,
  }) async {
    try {
      emit(IsLoading(state.data.copyWith(isLoading: true)));
      //movies new update
      final newUpdateResponse = await dataRepository.getMoviesNewUpdate(
        slug: 'phim-moi-cap-nhat',
        page: 1,
      );
      final movieResponse = await dataRepository.getMovies(
        slug: 'phim-le',
        page: 1,
      );
      final tvSeriesResponse = await dataRepository.getMovies(
        slug: 'phim-bo',
        page: 1,
      );
      final cartoonResponse = await dataRepository.getMovies(
        slug: 'hoat-hinh',
        page: 1,
      );
      final tvShowResponse = await dataRepository.getMovies(
        slug: 'tv-shows',
        page: 1,
      );
      final newUpdates = newUpdateResponse.items ?? [];
      final movies = movieResponse.data!.items ?? [];
      final tvSeries = tvSeriesResponse.data!.items ?? [];
      final cartoons = cartoonResponse.data!.items ?? [];
      final tvShows = tvShowResponse.data!.items ?? [];
      emit(
        GetMoviesNewUpdate(state.data.copyWith(moviesNewUpdate: newUpdates)),
      );
      emit(GetMoviesMovie(state.data.copyWith(moviesMovie: movies)));
      emit(GetMoviesTVSeries(state.data.copyWith(moviesTVSerie: tvSeries)));
      emit(GetMoviesCartoon(state.data.copyWith(moviesCartoon: cartoons)));
      emit(GetMoviesTVShow(state.data.copyWith(moviesTVShow: tvShows)));
    } catch (error) {
      debugPrint('Get moview new update error: $error');
    } finally {
      emit(IsLoading(state.data.copyWith(isLoading: false)));
    }
  }
}
