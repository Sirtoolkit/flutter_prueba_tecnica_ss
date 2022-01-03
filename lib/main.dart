import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/screens/home_page.dart';
import '/themes/themes.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Repos',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      home: const HomePage(),
    );
  }
}
