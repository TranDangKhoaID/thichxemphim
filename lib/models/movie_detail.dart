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
  String? poster_url;
  String? thum_url;
  bool? is_copyright;
  bool? sub_docquyen;
  bool? chieurap;
  String? trailer_url;
  String? time;
  String? episode_current;
  String? episode_total;
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
    this.poster_url,
    this.thum_url,
    this.is_copyright,
    this.sub_docquyen,
    this.chieurap,
    this.trailer_url,
    this.time,
    this.episode_current,
    this.episode_total,
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
