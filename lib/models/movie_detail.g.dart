// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      created: json['created'] == null
          ? null
          : Created.fromJson(json['created'] as Map<String, dynamic>),
      modified: json['modified'] == null
          ? null
          : Created.fromJson(json['modified'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      originName: json['originName'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      posterUrl: json['posterUrl'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
      isCopyright: json['isCopyright'] as bool?,
      subDocquyen: json['subDocquyen'] as bool?,
      chieurap: json['chieurap'] as bool?,
      trailerUrl: json['trailerUrl'] as String?,
      time: json['time'] as String?,
      episodeCurrent: json['episodeCurrent'] as String?,
      episodeTotal: json['episodeTotal'] as String?,
      quality: json['quality'] as String?,
      lang: json['lang'] as String?,
      notify: json['notify'] as String?,
      showtimes: json['showtimes'] as String?,
      year: (json['year'] as num?)?.toInt(),
      view: (json['view'] as num?)?.toInt(),
      actor:
          (json['actor'] as List<dynamic>?)?.map((e) => e as String).toList(),
      director: (json['director'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: (json['country'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'created': instance.created,
      'modified': instance.modified,
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'originName': instance.originName,
      'content': instance.content,
      'type': instance.type,
      'status': instance.status,
      'posterUrl': instance.posterUrl,
      'thumbUrl': instance.thumbUrl,
      'isCopyright': instance.isCopyright,
      'subDocquyen': instance.subDocquyen,
      'chieurap': instance.chieurap,
      'trailerUrl': instance.trailerUrl,
      'time': instance.time,
      'episodeCurrent': instance.episodeCurrent,
      'episodeTotal': instance.episodeTotal,
      'quality': instance.quality,
      'lang': instance.lang,
      'notify': instance.notify,
      'showtimes': instance.showtimes,
      'year': instance.year,
      'view': instance.view,
      'actor': instance.actor,
      'director': instance.director,
      'category': instance.category,
      'country': instance.country,
    };
