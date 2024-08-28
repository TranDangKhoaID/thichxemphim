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
      final movieResponse = await dataRepository.getMoviesNewUpdate(
        slug: 'phim-moi-cap-nhat',
        page: 1,
      );
      final items = movieResponse.items ?? [];
      emit(GetMoviesNewUpdate(state.data.copyWith(moviesNewUpdate: items)));
    } catch (error) {
      debugPrint('Get moview new update error: $error');
    } finally {
      emit(IsLoading(state.data.copyWith(isLoading: false)));
    }
  }
}
