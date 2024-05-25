import 'package:http/http.dart' as http;
import 'dart:convert';

import '../API.dart';
import 'dataConn.dart';

class gamesConn {
  Future<List<jsonGames>> getGames() async {
    var response = await http.get(Uri.parse(API_LINK + "/games"));
    if (response.statusCode == 200) {
      List<jsonGames> games = [];
      var data = jsonDecode(response.body);
      for (var game in data) {
        games.add(jsonGames.fromJson(game));
      }
      return games;
    } else {
      throw Exception('Failed to load games');
    }
  }
}

// class gamesConn {
//   Future<List<dynamic>> getGames() async {
//     var response = await http.get(Uri.parse(API_LINK + "/games"));
//     if (response.statusCode == 200) {
//       List<dynamic> games = [];
//       var data = jsonDecode(response.body);
//       for (var game in data) {
//         games.add(game);
//       }
//       return games;
//     } else {
//       throw Exception('Failed to load games');
//     }
//   }
// }
