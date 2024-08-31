import 'package:json_annotation/json_annotation.dart';
import 'package:thichxemphim/models/movie.dart';
import 'package:thichxemphim/models/pagination.dart';

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
  Params? params;

  Data({this.items, this.params});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Params {
  Pagination? pagination;

  Params({this.pagination});

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}
