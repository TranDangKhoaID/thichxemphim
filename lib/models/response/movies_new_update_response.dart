import 'package:json_annotation/json_annotation.dart';
import 'package:thichxemphim/models/movie.dart';
import 'package:thichxemphim/models/pagination.dart';

part 'movies_new_update_response.g.dart';

@JsonSerializable()
class MoviesNewUpdateResponse {
  List<Movie>? items;
  Pagination? pagination;

  MoviesNewUpdateResponse({this.items, this.pagination});

  factory MoviesNewUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesNewUpdateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesNewUpdateResponseToJson(this);
}
