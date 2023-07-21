import 'package:otc/apis/apis.dart';
import 'package:otc/global/global.dart';

loginUtil({
  required String username,
  required String password,
}) async {
  final token = await apis.user.login({
    "username": username,
    "password": password,
  });

  await global.updateAuthorization(token);
}
