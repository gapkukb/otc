import 'package:otc/apis/apis.dart';
import 'package:otc/globals/globals.dart';
import 'package:otc/http/http.dart';

loginUtil({
  required String username,
  required String password,
}) async {
  final data = await apis.user.login({
    "username": username,
    "password": password,
  });

  Http.dio.options.headers.update(
    globals.keys.authorization,
    (value) => data.data,
  );
  await globals.prefs.setString(globals.keys.token, data.data);
}
