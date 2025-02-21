import 'package:flutter/material.dart';
import 'package:particles_flutter/component/particle/particle.dart';

class MapleLeafPainter extends CustomPainter {
  static Color randomColor = Colors.blue;
  static Paint? randomColorPaint;

  final List<Particle> particles;
  final List<List> lineOffsets;

  MapleLeafPainter({
    required this.particles,
    required this.lineOffsets,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < particles.length; index++) {
      Path path = Path();
      final scale =
          particles[index].size / 2000; // Scale factor since original maple leaf is 2000 units tall
      // Using the same path data as MapleLeafPainter
      path.moveTo(-90, 2030);
      path.lineTo(-45, 1167);
      path.arcToPoint(Offset(-156, 1069),
          radius: Radius.elliptical(95, 95), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(-1015, 1220);
      path.lineTo(-899, 900);
      path.arcToPoint(Offset(-919, 827),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(-1860, 65);
      path.lineTo(-1648, -34);
      path.arcToPoint(Offset(-1614, -113),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(-1800, -685);
      path.lineTo(-1258, -570);
      path.arcToPoint(Offset(-1185, -608),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(-1080, -855);
      path.lineTo(-657, -401);
      path.arcToPoint(Offset(-546, -458),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(-750, -1510);
      path.lineTo(-423, -1321);
      path.arcToPoint(Offset(-332, -1348),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(0, -2000);
      path.lineTo(332, -1348);
      path.arcToPoint(Offset(423, -1321),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(750, -1510);
      path.lineTo(546, -458);
      path.arcToPoint(Offset(657, -401),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(1080, -855);
      path.lineTo(1185, -608);
      path.arcToPoint(Offset(1258, -570),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(1800, -685);
      path.lineTo(1614, -113);
      path.arcToPoint(Offset(1648, -34),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(1860, 65);
      path.lineTo(919, 827);
      path.arcToPoint(Offset(899, 900),
          radius: Radius.elliptical(65, 65), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(1015, 1220);
      path.lineTo(156, 1069);
      path.arcToPoint(Offset(45, 1167),
          radius: Radius.elliptical(95, 95), rotation: 0, largeArc: false, clockwise: false);
      path.lineTo(90, 2030);
      path.close();

      // Update the transformation matrix to include rotation
      final matrix = Matrix4.translationValues(
        particles[index].position.dx,
        particles[index].position.dy,
        0,
      )
        ..rotateZ(particles[index].rotation) // Add rotation around Z axis
        ..scale(scale, scale);

      canvas.save();
      canvas.transform(matrix.storage);
      canvas.drawPath(
        path,
        Paint()
          ..color = particles[index].color
          ..style = PaintingStyle.fill,
      );
      canvas.restore();
    }
    for (int index = 0; index < lineOffsets.length; index++) {
      randomColorPaint = Paint()
        ..color = (lineOffsets[index][0] as Particle).color
        ..strokeWidth = (2 * (1 - lineOffsets[index][2] / 100)).toDouble();
      canvas.drawLine(
        (lineOffsets[index][0] as Particle).position,
        (lineOffsets[index][1] as Particle).position,
        randomColorPaint!,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
