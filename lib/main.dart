import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:otc/global/global.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/app.dart' deferred as app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await global.intialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  usePathUrlStrategy();

  await app.loadLibrary();

  runApp(
    ProviderScope(
      parent: provider,
      child: app.App(),
    ),
  );
}
