import 'package:hive/hive.dart';

part 'app_model.g.dart';
@HiveType(typeId: 1)
class AppModel {
  @HiveField(0)
  final num id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnail;
  @HiveField(3)
  final String shortDescription;
  @HiveField(4)
  final String gameUrl;
  @HiveField(5)
  final String genre;
  @HiveField(6)
  final String platform;
  @HiveField(7)
  final String developer;
  @HiveField(8)
  final String releaseDate;
  @HiveField(9)
  final String freeToGameProfileUrl;
  @HiveField(10)
  final String publisher;

  AppModel(
      {required this.id,
      required this.title,
      required this.developer,
      required this.freeToGameProfileUrl,
      required this.gameUrl,
      required this.genre,
      required this.platform,
      required this.releaseDate,
      required this.shortDescription,
      required this.thumbnail,
      required this.publisher});

  factory AppModel.fromJson(Map<String, dynamic> json) {
    return AppModel(
        id: json["id"] as num? ?? 0,
        title: json["title"] as String? ?? "",
        developer: json["developer"] as String? ?? "",
        freeToGameProfileUrl: json["freetogame_profile_url"] as String? ?? "",
        gameUrl: json["game_url"] as String? ?? "",
        genre: json["genre"] as String? ?? "",
        platform: json["platform"] as String? ?? "",
        releaseDate: json["release_date"] as String? ?? "",
        shortDescription: json["short_description"] as String? ?? "",
        thumbnail: json["thumbnail"] as String? ?? "",
        publisher: json["publisher"] as String? ?? "");
  }
}
