import 'package:bot_toast/bot_toast.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/generated/l10n.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/providers/otc.provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/theme.dart';

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
      ref.read(userProvider.notifier)
        ..updateUser()
        ..timerRefreshToken();
      ref.read(walletProvider.notifier).updateWallet();

      if (ref.read(kycProvider)?.lv1Status == KycStatus.pass) {
        ref.read(otcProvider.notifier).updateOTC();
      }
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
        return "猫耳朵 - 做市商最高返佣的交易所";
      },
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
