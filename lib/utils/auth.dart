import 'package:otc/utils/predication.dart';

Future<bool> authUtil() async {
  return await predication(
    types: [
      Predication.phone,
      Predication.kyc1,
      Predication.funds,
      Predication.captcha,
    ],
  );
}
