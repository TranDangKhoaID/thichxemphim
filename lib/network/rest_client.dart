import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:thichxemphim/models/response/movies_new_update_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  /// MARK: - Initials;
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/danh-sach/{slug}?page{page}')
  Future<MoviesNewUpdateResponse> getMoviesNewUpdate({
    @Path('slug') required String slug,
    @Path('page') int? page,
  });
}
