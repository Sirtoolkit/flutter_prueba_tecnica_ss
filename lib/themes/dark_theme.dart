part of 'themes.dart';

class DarkTheme {
  static final theme = ThemeData.light().copyWith(
    primaryColor: const Color(0xFFfafdf6),
    backgroundColor: const Color(0xFFfafdf6),
    scaffoldBackgroundColor: const Color(0xFF2B3135),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: Color(0xFF2B3137),
      color: Color(0xFFfafdf6),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        color: Color(0xFFfafdf6),
        fontSize: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFfafdf6),
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFfafdf6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
            color: Color(0xFFfafdf6), style: BorderStyle.solid, width: 1.0),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF2B3137),
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF2B3130),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Color(0xFFfafdf6),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: Color(0xFFfafdf6),
        fontSize: 16,
      ),
    ),
  );
}
