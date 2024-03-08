
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:developer';

// import 'home.dart';
import 'login_page.dart';


void main() async {
String PlatformDevice = '';
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    log('Running on the web!');
    PlatformDevice = 'web';
  } else {
    if (Platform.isAndroid) {
      log('Running on Android!');
      PlatformDevice = 'Android';
    } else if (Platform.isIOS) {
      log('Why are you lauging?');
      PlatformDevice = 'iOS';
    }
  }
  if (PlatformDevice == 'Android') {
    await checkAndRequestStoragePermission();
  }
  runApp(MyApp(PlatformDevice: PlatformDevice));
}


Future<void> checkAndRequestStoragePermission() async {
  var status = await Permission.storage.status;

  if (status != PermissionStatus.granted) {
    // Permission hasn't been granted, request it.
    await Permission.storage.request();
  }
}



class MyApp extends StatelessWidget {
  String PlatformDevice = '';
  MyApp({super.key, required this.PlatformDevice});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 140, 96, 218)),
        useMaterial3: true,
      ),
      home : LoginPage( PlatformDevice: PlatformDevice),
    );
  }
}



