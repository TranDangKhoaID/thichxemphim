import 'package:hive/hive.dart';

part 'movie_favorite.g.dart';

@HiveType(typeId: 0)
class MovieFavorite {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? slug;

  @HiveField(2)
  final String? poster_url;

  MovieFavorite({
    this.name,
    this.slug,
    this.poster_url,
  });
}
