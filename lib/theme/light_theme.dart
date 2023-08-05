part of theme;

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.purple,
    primaryColorLight: Colors.purple.shade100,
    primaryColorDark: Colors.deepPurple,
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
    ));
