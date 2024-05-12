import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'API/API.dart';

import 'detailMeal.dart';

class Meals extends StatefulWidget {
  final String category;
  const Meals({super.key, required this.category});
  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  late Future<List<dynamic>> meals;
  late String category = widget.category;

  @override
  void initState() {
    super.initState();
    print("Category: $category");
    meals = fetchMeals();
  }

  Future<List<dynamic>> fetchMeals() async {
    final String API_URL = "${API_LINK}filter.php?c=$category";
    print(API_URL);
    final response = await http.get(Uri.parse(API_URL));
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: meals,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var fetchedData = snapshot.data!;
            print(fetchedData);
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => detailMeal(
                            id: fetchedData[index]['idMeal'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: LayoutBuilder(builder: (context, constraints) {
                        double imageHeight = constraints.maxHeight * 0.8;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              child: Image.network(
                                  fetchedData[index]['strMealThumb'],
                                  height: imageHeight,
                                  width: constraints.maxWidth),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(fetchedData[index]['strMeal'],
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        );
                      }),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
