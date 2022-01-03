part of 'themes.dart';

class LightTheme {
  static final theme = ThemeData.light().copyWith(
    primaryColor: const Color(0xFF2B3137),
    backgroundColor: const Color(0xFF2B3137),
    scaffoldBackgroundColor: const Color(0xFFfafdf6),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: Color(0xFFfafdf6),
      color: Color(0xFF2B3137),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        color: Color(0xFF2B3137),
        fontSize: 16,
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
            color: Color(0xFF2B3137), style: BorderStyle.solid, width: 1.0),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF2B3137),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Color(0xFF2B3137),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
