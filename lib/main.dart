import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/config/get_it_config.dart';
import '/provider/repos_user_provider.dart';
import '/screens/home_page.dart';
import '/themes/themes.dart';

void main() {
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReposUserProvider()),
      ],
      child: MaterialApp(
        title: 'Github Repos',
        debugShowCheckedModeBanner: false,
        theme: LightTheme.theme,
        home: const HomePage(),
      ),
    );
  }
}
