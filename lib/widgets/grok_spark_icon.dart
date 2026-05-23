import 'package:flutter/material.dart';

class GrokSparkIcon extends StatelessWidget {
  const GrokSparkIcon({
    super.key,
    this.size = 24.0,
    this.color = const Color(0xFF71767B),
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GrokSparkPainter(color: color),
      ),
    );
  }
}

class _GrokSparkPainter extends CustomPainter {
  _GrokSparkPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    // Asymmetric 4-pointed diamond spark
    final path = Path()
      ..moveTo(cx, cy - r) // top
      ..quadraticBezierTo(cx + r * 0.15, cy - r * 0.15, cx + r, cy) // right
      ..quadraticBezierTo(cx + r * 0.15, cy + r * 0.15, cx, cy + r) // bottom
      ..quadraticBezierTo(cx - r * 0.15, cy + r * 0.15, cx - r, cy) // left
      ..quadraticBezierTo(cx - r * 0.15, cy - r * 0.15, cx, cy - r) // close
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_GrokSparkPainter oldDelegate) =>
      oldDelegate.color != color;
}
