import 'package:json_annotation/json_annotation.dart';
import 'package:thichxemphim/models/movie.dart';

part 'search_movie_response.g.dart';

@JsonSerializable()
class SearchMovieResponse {
  Data? data;

  SearchMovieResponse({this.data});

  factory SearchMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchMovieResponseToJson(this);
}

@JsonSerializable()
class Data {
  List<Movie>? items;

  Data({this.items});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
