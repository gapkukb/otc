import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class ChartLoading extends StatefulWidget {
  const ChartLoading({super.key});

  @override
  State<ChartLoading> createState() => _ChartLoadingState();
}

class _ChartLoadingState extends State<ChartLoading> with SingleTickerProviderStateMixin {
  final painter = Paint()..strokeWidth = 2;
  late final AnimationController controller;
  List<Offset> points = [];

  @override
  void initState() {
    points = createPoints();
    painter.color = color;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..addListener(() {
        Future.delayed(const Duration(seconds: 2), () {
          if (!mounted) {
            if (controller.isCompleted) {
              points = createPoints();
              painter.color = color;
              controller.forward(from: 0.0);
            }
            setState(() {});
          }
        });
      });

    super.initState();
  }

  Color get color {
    return Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
  }

  List<Offset> createPoints() {
    const size = 1000;
    const height = 300;
    final ox = math.Random().nextInt(10) + 10;
    final length = math.Random().nextInt(20) + 20;
    final cw = (size - 10 * 2) / length;

    final xs = List.generate(length, (index) => cw * index + ox);
    final points = xs
        .asMap()
        .map((i, x) {
          const padding = height / 4;
          return MapEntry(i, Offset(x, padding + math.Random().nextInt((height / 2).toInt()).toDouble()));
        })
        .values
        .toList();
    return points;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: const Size(300, 300),
        painter: ChartLoadingPainter(points, controller.value, painter),
      ),
    );
  }
}

class ChartLoadingPainter extends CustomPainter {
  final List<Offset> points;
  final double precent;
  final Paint painter;
  ChartLoadingPainter(this.points, this.precent, this.painter);

  @override
  void paint(canvas, size) {
    final length = (points.length * precent).floor();
    final subPoints = points.sublist(0, length);
    painter.color = painter.color.withOpacity(precent);
    canvas.drawPoints(PointMode.polygon, subPoints, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
