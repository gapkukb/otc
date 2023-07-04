part of http;

Future loop(
  Function excusation,
  int? interval,
) async {
  excusation();
  await Future.delayed(
    Duration(
      milliseconds: interval = 3000,
    ),
    () => loop(excusation, interval),
  );
}
