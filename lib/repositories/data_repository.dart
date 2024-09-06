import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:thichxemphim/common/configs.dart';
import 'package:thichxemphim/models/response/movie_detail_response.dart';
import 'package:thichxemphim/models/response/movies_new_update_response.dart';
import 'package:thichxemphim/models/response/movies_response.dart';
import 'package:thichxemphim/models/response/search_movie_response.dart';
import 'package:thichxemphim/network/rest_client.dart';

@lazySingleton
class DataRepository implements RestClient {
  /// MARK: - Initials;
  final dio = Dio();
  late RestClient _client;
  //final _appPref = locator<AppPreference>();

  DataRepository() {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ));
    }

    /// Middleware token
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          //final token = (await _appPref.getUser())?.accessToken;
          //debugPrint('Authorization token: ${'Bearer $token'}');
          //request.headers['Authorization'] = 'Bearer $token';
          request.headers['Accept'] = 'application/json';
          //request.headers['x-api-key'] = Configs.baseUrl;
          handler.next(request);
        },
      ),
    );

    _client = RestClient(dio, baseUrl: Configs.baseUrl);
  }

  @override
  Future<MoviesNewUpdateResponse> getMoviesNewUpdate({
    required String slug,
    int? page,
  }) {
    return _client.getMoviesNewUpdate(slug: slug, page: page);
  }

  @override
  Future<MoviesResponse> getMovies({required String slug, int? page}) {
    return _client.getMovies(slug: slug, page: page);
  }

  @override
  Future<MovieDetailResponse> getMovieDetail({required String slug}) {
    return _client.getMovieDetail(slug: slug);
  }

  @override
  Future<SearchMovieResponse> searchMovies({required String name}) {
    return _client.searchMovies(name: name);
  }
}
