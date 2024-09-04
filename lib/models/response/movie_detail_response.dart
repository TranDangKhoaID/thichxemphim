import 'package:json_annotation/json_annotation.dart';
import 'package:thichxemphim/models/movie_detail.dart';
import 'package:thichxemphim/models/episode.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse {
  MovieDetail? movie;
  List<ServerData>? episodes;

  MovieDetailResponse({
    this.movie,
    this.episodes,
  });

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}

@JsonSerializable()
class ServerData {
  String? serverName;
  List<Episode>? server_data;

  ServerData({
    this.serverName,
    this.server_data,
  });

  factory ServerData.fromJson(Map<String, dynamic> json) =>
      _$ServerDataFromJson(json);
  Map<String, dynamic> toJson() => _$ServerDataToJson(this);
}
