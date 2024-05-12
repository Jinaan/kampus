import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'API/API.dart';

class detailMeal extends StatefulWidget {
  final String id;
  const detailMeal({super.key, required this.id});
  @override
  _detailMealState createState() => _detailMealState();
}

class _detailMealState extends State<detailMeal> {
  late Future<List<dynamic>> detailMeal;
  late String id = widget.id;

  @override
  void initState() {
    super.initState();
    print("ID: $id");
    detailMeal = fetchDetailMeal();
  }

  Future<List<dynamic>> fetchDetailMeal() async {
    final String API_URL = "${API_LINK}lookup.php?i=$id";
    print(API_URL);
    final response = await http.get(Uri.parse(API_URL));
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['meals'];
    } else {
      throw Exception('Failed to load detailMeal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail Meal'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: detailMeal,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var fetchedData = snapshot.data!;
            print(fetchedData);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(fetchedData[0]['strMealThumb'],
                          height: 200, width: 200),
                    ),
                    Center(
                        child: Text(
                      fetchedData[0]['strMeal'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Category: " + fetchedData[0]['strCategory']),
                        Text("Area: " + fetchedData[0]['strArea']),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Ingredients:",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    for (int i = 1; i <= 20; i++)
                      if (fetchedData[0]['strIngredient$i'] != null &&
                          fetchedData[0]['strIngredient$i'].trim() != "")
                        Text(fetchedData[0]['strIngredient$i']),
                    SizedBox(height: 10),
                    Text("Instructions:",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(fetchedData[0]['strInstructions']),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _launchURL(Uri.parse(fetchedData[0]['strYoutube']));
                      },
                      child: const Text("Watch Video"),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
