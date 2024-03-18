import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
          title: Text('Detail Disease', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {
                // change collor
                
              }
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(messagepackage.imgUrls, width: 300, height: 300,),
                  Text(messagepackage.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("Disease Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  Text(messagepackage.name, style: TextStyle(fontSize: 15),),
                  Text("Plant Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  Text(messagepackage.plantName, style: TextStyle(fontSize: 15),),
                  Text("Ciri-ciri", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  Container(
                    width: 500,
                    height: 100,
                    child: ListView.builder(
                      itemCount: messagepackage.nutshell.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(messagepackage.nutshell[index], style: TextStyle(fontSize: 15),);
                      }
                    ),
                  ),
                  // Text("Ciri-ciri", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  // Text(messagepackage.nutshell, style: TextStyle(fontSize: 15),),
                  Text("Disease ID", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  Text(messagepackage.id, style: TextStyle(fontSize: 15),),
                  Text("Symptom", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  Container(
                    width: 500,
                    height: 100,
                    child: Text(messagepackage.symptom, style: TextStyle(fontSize: 15),)
                    ),
                    
                  FloatingActionButton(onPressed: () {
                    _LaunchURL('https://www.google.com/search?q=${messagepackage.name}');
                  }, child: Text('Search'),),
                ],
              ),
          ),
        
        ),
      ),
    );
  }
}


Future<void> _LaunchURL(URL) async {
  if (await canLaunchUrl(URL)) {
    await launchUrl(URL);
  } else {
    throw 'Could not launch $URL';
  }
}
