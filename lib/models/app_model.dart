class AppModel {
  final num id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String developer;
  final String releaseDate;
  final String freeToGameProfileUrl;

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
      required this.thumbnail});

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
        thumbnail: json["thumbnail"] as String? ?? "");
  }
}
