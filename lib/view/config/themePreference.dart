// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DarkThemePreference {
//   static const themeStatus = 'Theme Status';

//   setDarkTheme(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool(themeStatus, value);
//   }

//   Future<bool?> getTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.getBool((themeStatus)) ?? false;
//   }
// }

class AppTheming {
  static ThemeData lightThemeData() {
    return ThemeData(
        fontFamily: 'Gilroy',
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme(
          primary: Colors.deepPurple,
          primaryVariant: Colors.deepPurpleAccent,
          secondary: Colors.amber,
          secondaryVariant: Colors.amberAccent,
          surface: Colors.white,
          background: Colors.white,
          error: Colors.redAccent,
          onPrimary: Colors.black12,
          onSecondary: Colors.black,
          onSurface: Colors.grey,
          onBackground: Colors.black,
          onError: Colors.black,
          brightness: Brightness.light,
        ),
        backgroundColor: Colors.white);
  }

  static ThemeData darkThemeData() {
    return ThemeData(
        fontFamily: 'Gilroy',
        scaffoldBackgroundColor: Colors.grey.shade900,
        textTheme: TextTheme(),
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme(
          primary: Colors.deepPurple,
          primaryVariant: Colors.deepPurpleAccent,
          secondary: Colors.amber,
          secondaryVariant: Colors.amberAccent,
          surface: Colors.black,
          background: Colors.black,
          error: Colors.redAccent,
          onPrimary: Colors.black12,
          onSecondary: Colors.black,
          onSurface: Colors.grey,
          onBackground: Colors.white,
          onError: Colors.black,
          brightness: Brightness.dark,
        ),
        backgroundColor: Colors.black);
  }
}





// class DarkThemeProvider with ChangeNotifier {
//   DarkThemePreference darkThemePreference = DarkThemePreference();
//   bool _darkTheme = false;

//   bool get darkTheme => _darkTheme;

//   set darkTheme(bool value) {
//     _darkTheme = value;
//     darkThemePreference.setDarkTheme(value);
//     notifyListeners();
//   }
// }