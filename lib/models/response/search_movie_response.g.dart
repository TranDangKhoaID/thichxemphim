// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovieResponse _$SearchMovieResponseFromJson(Map<String, dynamic> json) =>
    SearchMovieResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchMovieResponseToJson(
        SearchMovieResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'items': instance.items,
    };
