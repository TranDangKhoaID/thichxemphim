// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieHistoryAdapter extends TypeAdapter<MovieHistory> {
  @override
  final int typeId = 1;

  @override
  MovieHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieHistory(
      name: fields[0] as String?,
      slug: fields[1] as String?,
      poster_url: fields[2] as String?,
      indexSelected: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieHistory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.poster_url)
      ..writeByte(3)
      ..write(obj.indexSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
