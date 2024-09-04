import 'package:thichxemphim/models/category.dart';
import 'package:thichxemphim/models/created.dart';

import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  Created? created;
  Created? modified;
  String? id;
  String? name;
  String? slug;
  String? originName;
  String? content;
  String? type;
  String? status;
  String? posterUrl;
  String? thumbUrl;
  bool? isCopyright;
  bool? subDocquyen;
  bool? chieurap;
  String? trailerUrl;
  String? time;
  String? episodeCurrent;
  String? episodeTotal;
  String? quality;
  String? lang;
  String? notify;
  String? showtimes;
  int? year;
  int? view;
  List<String>? actor;
  List<String>? director;
  List<Category>? category;
  List<Category>? country;

  MovieDetail({
    this.created,
    this.modified,
    this.id,
    this.name,
    this.slug,
    this.originName,
    this.content,
    this.type,
    this.status,
    this.posterUrl,
    this.thumbUrl,
    this.isCopyright,
    this.subDocquyen,
    this.chieurap,
    this.trailerUrl,
    this.time,
    this.episodeCurrent,
    this.episodeTotal,
    this.quality,
    this.lang,
    this.notify,
    this.showtimes,
    this.year,
    this.view,
    this.actor,
    this.director,
    this.category,
    this.country,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}
