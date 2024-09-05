// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieFavoriteAdapter extends TypeAdapter<MovieFavorite> {
  @override
  final int typeId = 0;

  @override
  MovieFavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieFavorite(
      name: fields[0] as String?,
      slug: fields[1] as String?,
      poster_url: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieFavorite obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.poster_url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieFavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
