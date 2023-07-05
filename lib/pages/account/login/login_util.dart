import 'package:dio/dio.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/global/global.dart';

loginUtil({
  required String username,
  required String password,
}) async {
  final resp = await apis.user.login(FormData.fromMap({
    "username": username,
    "password": password,
  }));

  await global.setToken(resp.data);
}
