import 'package:flutter/material.dart';

import '../../modules/symptoms.dart';
import '../../modules/diagnosis.dart';
import '../../modules/detail.dart';
import '../databank/detailPenyakit.dart';

class SymptomsPage extends StatefulWidget {
  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  Symptoms s = Symptoms();
  late List<String> symptomsKeys;
  late List<String> diagnosis = [];

  @override
  void initState() {
    super.initState();
    symptomsKeys = s.getSymptomsKeys();
    // print(symptomsKeys);
  }

  List<String> diagnose() {
    List<String> diagnosis = Diagnosis.diagnoseAll(s);
    return diagnosis;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                childAspectRatio: 3,
              ),
              itemCount: symptomsKeys.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(symptomsKeys[index]),
                  value: s.symptoms[symptomsKeys[index]],
                  onChanged: (bool? value) {
                    setState(() {
                      print(s.symptoms);
                      s.symptoms[symptomsKeys[index]] = value!;
                    });
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  diagnosis = diagnose();
                });
              },
              child: Text('Diagnose'),
            ),
            SizedBox(
              width: double.infinity,
              child: diagnosis.contains("Tidak ada diagnosis yang sesuai")
                  ? Center(
                      child: Text("Tidak ada diagnosis yang sesuai"),
                    )
                  : DataTable(
                      columns: [
                        DataColumn(label: Text('No.')),
                        DataColumn(label: Text('Diagnosis')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: diagnosis
                          .asMap()
                          .entries
                          .map(
                            (entry) => DataRow(cells: [
                              DataCell(Text((entry.key + 1).toString())),
                              DataCell(Text(entry.value)),
                              DataCell(ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPenyakit(
                                        diseaseName: entry.value,
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(Icons.search),
                              )),
                            ]),
                          )
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
