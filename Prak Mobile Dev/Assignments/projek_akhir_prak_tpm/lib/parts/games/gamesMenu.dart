import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/games/conn.dart';
import '../../API/games/dataConn.dart';
import 'package:provider/provider.dart';
import '../theme/themeProvider.dart';
import '../theme/theme.dart';
import 'gamesWidget.dart';

class GamesMenu extends StatefulWidget {
  @override
  _GamesMenuState createState() => _GamesMenuState();
}

class _GamesMenuState extends State<GamesMenu> {
  late Future<List<jsonGames>> _games;

  Future<void> _loadPrefsSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      var isDarkMode = prefs.getBool('isDarkMode') ?? false;
      if (isDarkMode) {
        Provider.of<ThemeProvider>(context, listen: false)
            .setThemeData(darkMode);
      } else {
        Provider.of<ThemeProvider>(context, listen: false)
            .setThemeData(lightMode);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPrefsSettings();
    _games = gamesConn().getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games Menu'),
      ),
      body: FutureBuilder<List<jsonGames>>(
        future: _games,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GamesWidget(games: snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
