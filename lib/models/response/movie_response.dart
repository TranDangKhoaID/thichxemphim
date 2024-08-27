import 'package:json_annotation/json_annotation.dart';
import 'package:thichxemphim/models/movie_model.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  Items? items;

  MovieResponse({this.items});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class Items {
  List<MovieModel>? items;

  Items({this.items});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
