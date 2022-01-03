part of 'themes.dart';

class LightTheme {
  static final theme = ThemeData.light().copyWith(
    primaryColor: const Color(0xFF2B3137),
    backgroundColor: const Color(0xFF2B3137),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF2B3137),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
