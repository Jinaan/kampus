class newCard {
  String title;
  String description;
  String imageUrl;
  List<String> genres;
  List<String> images;
  String longDescription;

  newCard.fromJson(Map json)
      : title = json['title'],
        description = json['description'],
        imageUrl = json['imageUrl'],
        genres = List<String>.from(json['genres']),
        images = List<String>.from(json['detailImageUrlList']),
        longDescription = json['longDescription'];

  Map toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'genres': genres,
      'images': images,
      'longDescription': longDescription
    };
  }
}
