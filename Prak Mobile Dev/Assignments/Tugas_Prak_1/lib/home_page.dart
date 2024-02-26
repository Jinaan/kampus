import 'package:flutter/material.dart';

import 'account_page.dart';

class home_page extends StatelessWidget {
  final String messagepackage;
  home_page({Key? key, required this.messagepackage}) : super(key: key);

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
          actions: [
            IconButton(
              // logout
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => account_page(messagepackage: messagepackage)));
              }
            ),
          ],
        ),
        body: Center(
          child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.network('https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png', width: 100, height: 100,),
                  // if got error use n -d chrome --web-renderer html
                  
                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //     color: Colors.red,
                  //     borderRadius: BorderRadius.circular(20),
                  //     image: DecorationImage(
                  //       image: NetworkImage('https://assets.tokopedia.net/assets-tokopedia-lite/v2/arael/kratos/672c8b0f.png'),
                  //       fit: BoxFit.cover
                  //     )
                  //   ),
                  // ),
                ],
              ),
        ),
      ),
    );
  }
}