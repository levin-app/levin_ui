import 'package:flutter/material.dart';

class LevinCard extends StatelessWidget {
  final Offset offset;
  final Color? cardColor;
  final Color shadowColor;
  final Color borderColor;
  final Color imageBorderColor;
  final EdgeInsetsGeometry? paddingData;
  final double? height;
  final double? width;
  final double borderWidth;
  final double shadowBlurRadius;
  final double imageBorderWidth;
  final BlurStyle shadowBlurStyle;
  final Widget? child;

  const LevinCard({
    Key? key,
    this.offset = const Offset(4, 4),
    this.cardColor,
    this.shadowColor = const Color(0xFF080808),
    this.borderColor = Colors.black,
    this.imageBorderColor = Colors.black,
    this.paddingData,
    this.height,
    this.width,
    this.borderWidth = 3.0,
    this.shadowBlurRadius = 0.0,
    this.imageBorderWidth = 3.0,
    this.shadowBlurStyle = BlurStyle.solid,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      width: width,
      padding: paddingData,
      decoration: BoxDecoration(
        color: cardColor ?? theme.cardColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: offset,
            blurRadius: shadowBlurRadius,
            blurStyle: shadowBlurStyle,
          ),
        ],
      ),
      child: child,
    );
  }
}
