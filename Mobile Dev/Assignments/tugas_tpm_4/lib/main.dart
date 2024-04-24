import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'loginPage.dart';
import 'package:provider/provider.dart';
import 'theme/theme.dart';
import 'package:http/http.dart' as http;
import 'package:tesat1/theme/themeProvider.dart';

import 'home.dart';
import 'MyHomePage.dart';

void main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: LoginPage(),
      // home: HomePage(),
      home: MyHomePage(),
      // theme: lightMode,
      // darkTheme: darkMode,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
