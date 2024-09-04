import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  String? name;
  String? slug;
  String? filename;
  String? link_embed;
  String? link_m3u8;

  Episode({
    this.name,
    this.slug,
    this.filename,
    this.link_embed,
    this.link_m3u8,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
