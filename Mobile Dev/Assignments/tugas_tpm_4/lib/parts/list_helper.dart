import 'package:http/http.dart' as http;

String apiUrl = 'http://192.168.1.16:8888'; // Replace with your API endpoint

class ListHelper {
  static Future<void> addToWantList(String item) async {
    String wantApiUrl = apiUrl + '/wanted';
    try {
      var response =
          await http.post(Uri.parse(wantApiUrl), body: {'item': item});
      if (response.statusCode == 200) {
        print('Item added to want list: $item');
      } else {
        throw Exception('Failed to add item to want list');
      }
    } catch (e) {
      print('Error adding item to want list: $e');
      throw e;
    }
  }

  static Future<void> addToWasteList(String item) async {
    String wasteApiUrl = apiUrl + '/wasted';
    try {
      var response =
          await http.post(Uri.parse(wasteApiUrl), body: {'item': item});
      if (response.statusCode == 200) {
        print('Item added to waste list: $item');
      } else {
        throw Exception('Failed to add item to waste list');
      }
    } catch (e) {
      print('Error adding item to waste list: $e');
      throw e;
    }
  }
}
