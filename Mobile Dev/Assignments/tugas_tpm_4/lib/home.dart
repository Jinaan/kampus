import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tesat1/theme/themeProvider.dart';
import 'package:tesat1/parts/swipeAction.dart';
import 'package:tesat1/parts/MenuOverlay.dart';
import 'package:tesat1/parts/GameCard.dart';
import 'package:tesat1/parts/swipeContent.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _TabbedAppState createState() => _TabbedAppState();
}

class _TabbedAppState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
        title: Text('ADGC Page'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(Icons.sunny),
          ),
        ],
      ),
      body: SwipeContent(),
    );
  }
}
