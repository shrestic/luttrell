part of 'theme.dart';

final ThemeData appThemeData = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white,
    focusColor: Colors.white,
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: kErrorColor)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: kErrorColor)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
    border: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
  ),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(primary: kPrimaryColor).copyWith(secondary: kPrimaryColor),
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Source Sans Pro',
  buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary, buttonColor: kPrimaryColor),
);

const double kHorizontalContentPadding = 15.0;
