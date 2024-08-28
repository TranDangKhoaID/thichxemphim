part of 'home_cubit.dart';

@freezed
class HomeStateData with _$HomeStateData {
  const factory HomeStateData({
    @Default([]) List<Movie> moviesNewUpdate,
    @Default(false) bool isLoading,
  }) = _HomeStateData;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(HomeStateData data) = _Initial;
  const factory HomeState.getMoviesNewUpdate(HomeStateData data) =
      GetMoviesNewUpdate;
  const factory HomeState.isLoading(HomeStateData data) = IsLoading;
}
