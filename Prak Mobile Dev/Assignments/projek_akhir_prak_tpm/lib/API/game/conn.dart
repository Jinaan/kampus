import 'dart:convert';
import 'package:http/http.dart' as http;

import '../API.dart';

class GamesConn {
  Future<JsonGameDetails> getGameDetails(int id) async {
    var response = await http.get(Uri.parse(API_LINK + "/game?id=$id"));
    if (response.statusCode == 200) {
      return JsonGameDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load game details');
    }
  }
}

class JsonGameDetails {
  int? id;
  String? title;
  String? thumbnail;
  String? status;
  String? shortDescription;
  String? description;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;
  MinimumSystemRequirements? minimumSystemRequirements;
  List<Screenshots>? screenshots;

  JsonGameDetails(
      {this.id,
      this.title,
      this.thumbnail,
      this.status,
      this.shortDescription,
      this.description,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl,
      this.minimumSystemRequirements,
      this.screenshots});

  JsonGameDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    shortDescription = json['short_description'];
    description = json['description'];
    gameUrl = json['game_url'];
    genre = json['genre'];
    platform = json['platform'];
    publisher = json['publisher'];
    developer = json['developer'];
    releaseDate = json['release_date'];
    freetogameProfileUrl = json['freetogame_profile_url'];
    minimumSystemRequirements = json['minimum_system_requirements'] != null
        ? new MinimumSystemRequirements.fromJson(
            json['minimum_system_requirements'])
        : null;
    if (json['screenshots'] != null) {
      screenshots = <Screenshots>[];
      json['screenshots'].forEach((v) {
        screenshots!.add(new Screenshots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['status'] = this.status;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['game_url'] = this.gameUrl;
    data['genre'] = this.genre;
    data['platform'] = this.platform;
    data['publisher'] = this.publisher;
    data['developer'] = this.developer;
    data['release_date'] = this.releaseDate;
    data['freetogame_profile_url'] = this.freetogameProfileUrl;
    if (this.minimumSystemRequirements != null) {
      data['minimum_system_requirements'] =
          this.minimumSystemRequirements!.toJson();
    }
    if (this.screenshots != null) {
      data['screenshots'] = this.screenshots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MinimumSystemRequirements {
  String? os;
  String? processor;
  String? memory;
  String? graphics;
  String? storage;

  MinimumSystemRequirements(
      {this.os, this.processor, this.memory, this.graphics, this.storage});

  MinimumSystemRequirements.fromJson(Map<String, dynamic> json) {
    os = json['os'];
    processor = json['processor'];
    memory = json['memory'];
    graphics = json['graphics'];
    storage = json['storage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['os'] = this.os;
    data['processor'] = this.processor;
    data['memory'] = this.memory;
    data['graphics'] = this.graphics;
    data['storage'] = this.storage;
    return data;
  }
}

class Screenshots {
  int? id;
  String? image;

  Screenshots({this.id, this.image});

  Screenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
