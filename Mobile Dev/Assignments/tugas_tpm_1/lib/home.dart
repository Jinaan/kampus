import 'package:flutter/material.dart';

import 'calc.dart';
import 'odd_even.dart';

class home_page extends StatelessWidget {
  home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 140, 96, 218)),
        useMaterial3: true,
      ),

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Menu', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const crement(title: 'Increment Decrement')));
                  },
                  child: const Text('Increment Decrement'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const oddeven(title: 'Odd Even')));
                  },
                  child: const Text('Odd Even'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}