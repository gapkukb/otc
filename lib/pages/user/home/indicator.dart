import 'package:flutter/material.dart';
import 'dart:math' as math;

class Indicator extends StatefulWidget {
  double value;
  Size size;
  Color color;
  Color secondarColor;
  double lineWidth;
  double lineHeight;
  int scaleCount;
  double max;

  Function(
    Canvas canvas,
    Size size,
  ) renderText;

  Indicator({
    super.key,
    this.value = 0,
    this.size = const Size(108, 108),
    this.color = Colors.blue,
    this.secondarColor = Colors.blueGrey,
    this.lineHeight = 10,
    this.lineWidth = 2,
    this.scaleCount = 60,
    this.max = 100,
    this.renderText = _render,
  });

  @override
  State<Indicator> createState() => _IndicatorState();

  static _render(Canvas canvas, Size size) {}
}

class _IndicatorState extends State<Indicator> {
  final List<Offset> _points = [];
  late Paint painter;
  late TextPainter textPainter;

  @override
  void initState() {
    super.initState();
    // 缓存所有点位
    _createPoints();

    painter = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = widget.lineWidth
      ..color = widget.color;
  }

  static double _getX(double radius, double offset, double angle) {
    return radius + offset * math.cos((angle - 90) * math.pi / 180);
  }

  static double _getY(double radius, double offset, double angle) {
    return radius + offset * math.sin((angle - 90) * math.pi / 180);
  }

  _createPoints() {
    var radius = math.min(widget.size.width, widget.size.height) / 2;
    var outer = radius;
    var inner = outer - widget.lineHeight;
    var count = widget.scaleCount;
    var eachAngle = 360.0 / count;

    for (double i = 0; i < count; i++) {
      var angle = i * eachAngle;

      _points.add(
        Offset(_getX(radius, outer, angle), _getY(radius, outer, angle)),
      );

      _points.add(
        Offset(_getX(radius, inner, angle), _getY(radius, inner, angle)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: widget.size,
        painter: Painter(
          points: _points,
          value: widget.value,
          color: widget.color,
          secondarColor: widget.secondarColor,
          renderText: widget.renderText,
          painter: painter,
          max: widget.max,
          lineHeight: widget.lineHeight,
          lineWidth: widget.lineWidth,
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  double value;
  List<Offset> points;
  Color color;
  Color secondarColor;
  Paint painter;
  double max;
  double lineWidth;
  double lineHeight;

  Function(
    Canvas canvas,
    Size size,
  ) renderText;

  Painter({
    required this.points,
    required this.value,
    required this.color,
    required this.secondarColor,
    required this.renderText,
    required this.painter,
    required this.max,
    required this.lineWidth,
    required this.lineHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _paintScales(canvas, size);
    _paintText(canvas, size, value);
  }

  _paintScales(Canvas canvas, Size size) {
    var n = points.length;
    var precent = math.min(value / max, 1);
    var isHighlight = false;
    late Offset point;
    late Offset p1;
    late Offset p2;

    for (int i = 0, j = 0; i < n; i += 2, j++) {
      isHighlight = (i / n) > precent && painter.color != secondarColor;
      p1 = points[i];
      p2 = points[i + 1];

      if (isHighlight) {
        painter.color = secondarColor;
        point = p2 + Offset(lineHeight / 2, lineHeight / 2);
      } else {}
      canvas.drawLine(p1, p2, painter);
    }
    canvas.save();
    canvas.drawCircle(
      point,
      8,
      painter
        ..color = color
        ..strokeWidth = 10,
    );

    canvas.drawCircle(
      point,
      4,
      painter
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );

    canvas.restore();
  }

  _paintText(Canvas canvas, Size size, double value) {
    TextSpan span = TextSpan(
      style: TextStyle(
        color: color,
        fontSize: 28,
        height: 1,
      ),
      text: "${value.toInt()}%",
      children: [
        TextSpan(
          style: TextStyle(
            color: color,
            fontSize: 14,
          ),
          text: "\n${value > 66 ? "高" : value > 33 ? "中" : "低"}",
        ),
      ],
    );
    TextPainter tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    tp.layout(maxWidth: size.width);
    tp.paint(
      canvas,
      Offset(
        (size.width - tp.width) / 2,
        (size.height - tp.height) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
