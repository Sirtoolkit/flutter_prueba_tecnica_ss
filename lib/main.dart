import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_prueba_tecnica_ss/screens/home_page.dart';

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
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF2B3137),
        backgroundColor: const Color(0xFF2B3137),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF2B3137),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const HomePage(),
    );
  }
}
