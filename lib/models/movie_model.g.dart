// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      origin_name: json['origin_name'] as String?,
      poster_url: json['poster_url'] as String?,
      thumb_url: json['thumb_url'] as String?,
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'origin_name': instance.origin_name,
      'poster_url': instance.poster_url,
      'thumb_url': instance.thumb_url,
      'year': instance.year,
    };
