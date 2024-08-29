import 'package:json_annotation/json_annotation.dart';
import 'package:thichxemphim/models/movie.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  Data? data;

  MoviesResponse({this.data});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable()
class Data {
  List<Movie>? items;

  Data({this.items});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
