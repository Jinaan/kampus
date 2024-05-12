import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'API/API.dart';

import 'meals.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<dynamic>> categories;

  @override
  void initState() {
    super.initState();
    categories = fetchCategories();
  }

  Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse(API_LINK + 'categories.php'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['categories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var fetchedData = snapshot.data!;
            print(fetchedData);
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Meals(
                          category: fetchedData[index]['strCategory'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Center(
                          child: Image.network(
                            fetchedData[index]['strCategoryThumb'],
                            width: 150,
                            height: 150,
                          ),
                        ),
                        Center(
                          child: Text(fetchedData[index]['strCategory'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            fetchedData[index]['strCategoryDescription'],
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to load categories'),
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
