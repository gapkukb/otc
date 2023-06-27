import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:otc/generated/l10n.dart';
import 'package:otc/globals/globals.dart';
import 'package:otc/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Globals.intialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  usePathUrlStrategy();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // 国际化
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        X.delegate,
      ],
      // 默认中文
      supportedLocales: X.delegate.supportedLocales,
      locale: const Locale('zh'),
      // 不支持的语言默认英语
      localeResolutionCallback: (locale, supportedLocales) {
        if (!supportedLocales.contains(locale)) {
          return const Locale('en');
        }
        return locale;
      },
      builder: BotToastInit(),
      routerConfig: router,
      title: X.current.title,
      onGenerateTitle: (context) {
        return X.current.title;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
