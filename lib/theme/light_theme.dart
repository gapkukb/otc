part of theme;

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  // fontFamily: "PingFangSC",
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xff522AD4),
  primaryColorLight: const Color(0xffE1E0FF),
  primaryColorDark: const Color(0xff07006D),
  // primarySwatch: ,

  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
  ),
  cardTheme: CardTheme(
    surfaceTintColor: Colors.white,
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(width: 1, color: Colors.grey.shade200),
    ),
  ),
  dialogTheme: DialogTheme(
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Color(0xff44475c),
    ),
  ),
  menuTheme: MenuThemeData(
    style: MenuStyle(
      shadowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
      surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
      elevation: MaterialStateProperty.resolveWith(
        (states) => 10,
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    // labelStyle: TextStyle(color: Color(0xff81899A)),
    errorStyle: TextStyle(color: Colors.red),
    suffixIconColor: Color(0xff81899A),
    suffixStyle: TextStyle(color: Color(0xff81899A)),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffd9d9d9),
      ),
    ),
  ),
  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(
      color: Color(0xffD9D9D9),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: const Color(0xff67748e)),
  ),
  dividerTheme: const DividerThemeData(
    color: Color(0xffd9d9d9),
  ),
);
