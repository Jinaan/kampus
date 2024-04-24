import 'Package:http/http.dart' as http;
import 'dart:async';
import 'Package:tesat1/API/templateAPI.dart';
import 'Package:tesat1/API/API.dart';

class newCardAPI {
  static Future getNewCard() {
    try {
      return http.get(Uri.parse('$API_URL/newCard'));
    } catch (e) {
      print(e);
      return Future.error('An error occurred');
    }
  }
}
