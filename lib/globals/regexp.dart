part of globals;

class _Regexp {
  final email = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final password = RegExp(r"^.{8,16}$");
}
