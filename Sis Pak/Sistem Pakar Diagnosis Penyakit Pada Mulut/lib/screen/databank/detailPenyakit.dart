import 'package:flutter/material.dart';
import '../../modules/detail.dart';

class DetailPenyakit extends StatelessWidget {
  final String diseaseName;

  DetailPenyakit({required this.diseaseName});

  @override
  Widget build(BuildContext context) {
    print(diseaseName); // Debugging (Optional
    // Get the index of the disease from the list
    int index = Detail().detail['DIAGNOSIS'].indexOf(diseaseName);
    String definition = Detail().detail['DEFINISI'][index];
    String treatment = Detail().detail['PENANGANAN'][index];

    return Scaffold(
      appBar: AppBar(
        title: Text(diseaseName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Definition:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                definition,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Treatment:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                treatment,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
