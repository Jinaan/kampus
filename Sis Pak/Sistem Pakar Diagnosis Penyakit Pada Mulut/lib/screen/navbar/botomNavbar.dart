import 'package:flutter/material.dart';

// import '../profile/profilePage.dart';

// import '../mainMenu/mainMenu.dart';

import '../mainpage/mainPage.dart';
import '../databank/tabelPenyakit.dart';

class BottomNavBar extends StatefulWidget {
  final String user;

  const BottomNavBar({required this.user});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavBar> {
  late String user;
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  // final List<Widget> _widgetOptions = <Widget>[
  //   MyHomePage(user: user),
  //   // MainMenu(),
  //   // ProfilePage(),
  //   // MainPage(),
  //   MainPage(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.user;
    _widgetOptions = <Widget>[
      MyHomePage(user: user),
      // MainMenu(),
      // ProfilePage(),
      // MainPage(),
      // MainPage(),
      TabelPenyakit(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Theme.of(context).colorScheme.secondary,
        // selectedItemColor: ,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Diagnose Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Databank Page',
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Main Page Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
