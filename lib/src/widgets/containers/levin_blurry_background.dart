import 'dart:ui';
import 'package:flutter/material.dart';

class LevinBlurryBackground extends StatelessWidget {
  final List<Color> colors;
  final List<Offset> positions;
  final double blurSigma;

  LevinBlurryBackground({
    this.colors = const [Colors.black, Colors.redAccent, Colors.blueAccent],
    this.positions = const [
      Offset(-50, 100),
      Offset(-80, 300),
      Offset(20, 500)
    ],
    this.blurSigma = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          for (int i = 0; i < colors.length; i++)
            Positioned(
              left: positions[i].dx,
              top: positions[i].dy,
              child: BlurredShape(
                  size: 150, color: colors[i], blurSigma: blurSigma),
            ),
        ],
      ),
    );
  }
}

class BlurredShape extends StatelessWidget {
  final double size;
  final Color color;
  final double blurSigma;

  const BlurredShape({
    this.size = 150,
    this.color = Colors.black,
    this.blurSigma = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
