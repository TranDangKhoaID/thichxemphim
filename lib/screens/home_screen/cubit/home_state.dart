part of 'home_cubit.dart';

@freezed
class HomeStateData with _$HomeStateData {
  const factory HomeStateData({
    @Default([]) List<Movie> moviesNewUpdate,
    @Default([]) List<Movie> moviesMovie,
    @Default([]) List<Movie> moviesTVSerie,
    @Default([]) List<Movie> moviesCartoon,
    @Default([]) List<Movie> moviesTVShow,
    @Default(false) bool isLoading,
  }) = _HomeStateData;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(HomeStateData data) = _Initial;
  const factory HomeState.getMoviesNewUpdate(HomeStateData data) =
      GetMoviesNewUpdate;
  const factory HomeState.getMoviesMovie(HomeStateData data) = GetMoviesMovie;
  const factory HomeState.getMoviesTVSeries(HomeStateData data) =
      GetMoviesTVSeries;
  const factory HomeState.getMoviesCartoon(HomeStateData data) =
      GetMoviesCartoon;
  const factory HomeState.getMoviesTVShow(HomeStateData data) = GetMoviesTVShow;
  const factory HomeState.isLoading(HomeStateData data) = IsLoading;
}
