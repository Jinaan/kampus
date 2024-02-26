import 'package:flutter/material.dart';


class account_page extends StatelessWidget {
  final String messagepackage;

  account_page({Key? key, required this.messagepackage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txt = TextEditingController();
    txt.text = messagepackage;
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
          title: Text("Account Page", style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: 
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 40),),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child : TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      controller: txt,
                    ),
                  ),
                  
                ],
              ),
        ),
      ),
    );
  }
}

