import 'package:hive/hive.dart';

part 'movie_history.g.dart';

@HiveType(typeId: 1)
class MovieHistory {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? slug;

  @HiveField(2)
  final String? poster_url;

  @HiveField(3)
  final int? indexSelected;

  MovieHistory({
    this.name,
    this.slug,
    this.poster_url,
    this.indexSelected,
  });
}
