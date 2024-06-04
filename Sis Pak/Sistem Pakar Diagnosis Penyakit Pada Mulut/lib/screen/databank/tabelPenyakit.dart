import 'package:flutter/material.dart';
import 'detailPenyakit.dart';
import '../../modules/detail.dart';

class TabelPenyakit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> diseases = Detail().detail['DIAGNOSIS'];

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Diseases'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                'No.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Disease',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Action',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: List.generate(
            diseases.length,
            (index) => DataRow(
              cells: [
                DataCell(Text((index + 1).toString())),
                DataCell(Text(diseases[index])),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPenyakit(
                            diseaseName: diseases[index],
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
