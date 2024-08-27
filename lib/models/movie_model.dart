import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  String? id;
  String? name;
  String? slug;
  String? origin_name;
  String? poster_url;
  String? thumb_url;
  int? year;

  MovieModel({
    this.id,
    this.name,
    this.slug,
    this.origin_name,
    this.poster_url,
    this.thumb_url,
    this.year,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
