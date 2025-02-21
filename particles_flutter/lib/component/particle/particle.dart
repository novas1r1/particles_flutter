// Single Particle Model
import 'dart:ui';

class Particle {
  final Color color;
  final double size;
  final Offset velocity;
  final double rotation;
  final ParticleType type;

  Particle({
    required this.color,
    required this.size,
    required this.velocity,
    required this.rotation,
    required this.type,
  });

  Offset _position = Offset(0, 0);

  set updatePosition(Offset newPosition) {
    _position = newPosition;
  }

  Offset get position => _position;
}

enum ParticleType {
  circle,
  mapleLeaf,
}
