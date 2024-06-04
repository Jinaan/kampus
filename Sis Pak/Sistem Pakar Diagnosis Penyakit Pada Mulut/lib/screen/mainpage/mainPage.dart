import 'package:flutter/material.dart';

import 'checkSymptoms.dart';

// membuat halaman utama dimana menerima parameter user dari login
class MyHomePage extends StatefulWidget {
  final String user;

  const MyHomePage({required this.user});

  @override
  _MyHomePage createState() => _MyHomePage();
}

// membuat state dari halaman utama
class _MyHomePage extends State<MyHomePage> {
  // membuat variabel untuk menampung data user
  late String user;

  // inisialisasi data user
  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  // diagnosa penyakit

  // membuat tampilan halaman utama
  @override
  Widget build(BuildContext context) {
    // return SymptomsPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $user'),
      ),
      body: SymptomsPage(),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => SymptomsPage()),
      //           );
      //         },
      //         child: Text('Check Symptoms'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
