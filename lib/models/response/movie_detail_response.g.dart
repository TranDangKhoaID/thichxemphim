// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailResponse _$MovieDetailResponseFromJson(Map<String, dynamic> json) =>
    MovieDetailResponse(
      movie: json['movie'] == null
          ? null
          : MovieDetail.fromJson(json['movie'] as Map<String, dynamic>),
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => ServerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailResponseToJson(
        MovieDetailResponse instance) =>
    <String, dynamic>{
      'movie': instance.movie,
      'episodes': instance.episodes,
    };

ServerData _$ServerDataFromJson(Map<String, dynamic> json) => ServerData(
      serverName: json['serverName'] as String?,
      server_data: (json['server_data'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServerDataToJson(ServerData instance) =>
    <String, dynamic>{
      'serverName': instance.serverName,
      'server_data': instance.server_data,
    };
