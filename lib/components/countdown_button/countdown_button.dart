import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:otc/global/global.dart';
import 'package:otc/pages/advertise/advertise.dart';
import 'package:otc/widgets/ui_button.dart';

class CountdownButton extends StatefulWidget {
  final String beforeText;
  final String endText;
  final String Function(CurrentRemainingTime time)? runingText;
  final int duration;
  final bool disabled;
  final void Function()? onEnd;
  final Future Function()? onPressed;
  final CountdownTimerController? controller;

  const CountdownButton({
    super.key,
    this.beforeText = "获取验证码",
    this.endText = "重新获取",
    this.runingText,
    this.duration = 5,
    this.disabled = false,
    this.onEnd,
    this.onPressed,
    this.controller,
  });

  @override
  State<CountdownButton> createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton> {
  late int _endTime;
  late final Function(CurrentRemainingTime time) render;

  bool isResend = false;
  bool disabled = false;

  @override
  void initState() {
    render = widget.runingText ?? (time) => "${time.sec}S";
    _endTime = DateTime.now().millisecondsSinceEpoch;
    var cachedTime = global.prefs.getInt(global.keys.countdownTime);

    if (cachedTime != null && _endTime < cachedTime) {
      _endTime = cachedTime;
      disabled = true;
    }

    super.initState();
  }

  int get duration {
    return widget.duration * 1000;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        child: UiButton(
          variant: UiButtonVariant.text,
          disabled: widget.disabled || disabled,
          onPressed: _send,
          child: CountdownTimer(
            controller: widget.controller,
            endTime: _endTime,
            widgetBuilder: (_, time) {
              return Text(
                time != null
                    ? render(time)
                    : isResend
                        ? widget.endText
                        : widget.beforeText,
              );
            },
            onEnd: () {
              if (disabled) {
                disabled = false;
                widget.onEnd?.call();
                setState(() {});
              }
            },
          ),
        ),
      ),
    );
  }

  _send() async {
    if (disabled) return;
    await widget.onPressed?.call();
    start();
  }

  start() {
    setState(() {
      _endTime = DateTime.now().millisecondsSinceEpoch + duration;
      isResend = true;
      disabled = true;
      global.prefs.setInt(global.keys.countdownTime, _endTime);
    });
  }
}
