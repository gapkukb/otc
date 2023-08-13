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

  // final future = app.loadLibrary();

  runApp(
    ProviderScope(
      parent: provider,
      child: FutureBuilder(
        future: app.loadLibrary(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return app.App();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ),
  );
}
