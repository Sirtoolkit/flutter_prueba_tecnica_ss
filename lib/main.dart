import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_prueba_tecnica_ss/provider/dark_mode_provider.dart';
import 'package:flutter_prueba_tecnica_ss/screens/details_screen.dart';
import 'package:provider/provider.dart';

import '/utils/navigation_services.dart';
import '/config/get_it_config.dart';
import '/provider/repos_user_provider.dart';
import '/screens/home_screen.dart';
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
        ChangeNotifierProvider(create: (_) => DarkModeProvider()),
        ChangeNotifierProvider(create: (_) => ReposUserProvider()),
      ],
      child: Consumer<DarkModeProvider>(
        builder: (context, value, child) => (MaterialApp(
          navigatorKey: locator<NavigationServices>().navigatorKey,
          title: 'Github Repos',
          theme: value.darkMode ? DarkTheme.theme : LightTheme.theme,
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            DetailsScreen.routeName: (context) => const DetailsScreen(),
          },
        )),
      ),
    );
  }
}
