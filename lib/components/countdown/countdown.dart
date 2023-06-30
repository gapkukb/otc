import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  State<Countdown> createState() => _CountdownState();
}

// 全局单例计时器
int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

class _CountdownState extends State<Countdown> with WidgetsBindingObserver {
  @override
  void initState() async {
    var prefs = await SharedPreferences.getInstance();
    var lastTime = prefs.getInt('count_down_last_time');
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.paused) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
          // child: CountdownTimer(
          //   endTime: endTime,
          //   widgetBuilder: (_, time) {
          //     if (time == null) {
          //       return Text('Game over');
          //     }
          //     return Text(
          //         'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
          //   },
          // ),
          ),
    );
  }
}
