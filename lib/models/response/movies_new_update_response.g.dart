// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_new_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesNewUpdateResponse _$MoviesNewUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    MoviesNewUpdateResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesNewUpdateResponseToJson(
        MoviesNewUpdateResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
