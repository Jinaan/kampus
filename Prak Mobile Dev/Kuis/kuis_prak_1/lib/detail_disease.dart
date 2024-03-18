import 'package:flutter/material.dart';

class DetailDisease extends StatelessWidget {
  var messagepackage;
  DetailDisease({Key? key, required this.messagepackage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          // leading: Icon(Icons.menu),
          title: Text('Welcome $messagepackage', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(messagepackage.imgUrls, width: 300, height: 300,),
                  Text(messagepackage.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("Disease Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  Text(messagepackage.name, style: TextStyle(fontSize: 15),),
                  Text(messagepackage.symptom, style: TextStyle(fontSize: 15),),
                ],
              ),
        ),
      ),
    );
  }
}