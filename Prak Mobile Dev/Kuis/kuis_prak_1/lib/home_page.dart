import 'dart:html';

import 'package:flutter/material.dart';

import 'disease_data.dart';
import 'detail_disease.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var diseaseData = listDisease;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Home Screen', style: TextStyle(color: Colors.white)),
        ),
        body: _conainerImage(diseaseData),
      ),
    );
  }
}

Widget _conainerImage(diseaseData) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
    ),
    itemCount: diseaseData.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child: Column(
          children: [
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailDisease(messagepackage: diseaseData[index]),
                  ),
                )
              },
              child: Container(
                child: Column(
                  children: [
                    Image(
                    image: NetworkImage(diseaseData[index].imgUrls),
                    width: 200,
                    height: 200,
                  ),
                  Text(diseaseData[index].name),
                  ]
                ),
              ),
            )
            // Image.network(diseaseData[index].imgUrls),
            
          ],
        ),
      );
    },
  );
}
