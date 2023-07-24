import 'package:bot_toast/bot_toast.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:otc/generated/l10n.dart';
import 'package:otc/global/global.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await global.intialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  usePathUrlStrategy();
  runApp(
    ProviderScope(
      parent: provider,
      child: const App(),
    ),
  );
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    final authed = ref.read(authProvider);
    if (authed) {
      ref.read(userProvider.notifier).updateUser();
      ref.read(walletProvider.notifier).updateWallet();
    }
    theme.addListener(themeHandle);
  }

  @override
  dispose() {
    theme.removeListener(themeHandle);
    super.dispose();
  }

  themeHandle() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // 国际化
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        CountryLocalizations.delegate,
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
      // title: X.current.title,
      onGenerateTitle: (context) {
        return X.current.title;
      },
      debugShowCheckedModeBanner: false,
      themeMode: theme.mode,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
