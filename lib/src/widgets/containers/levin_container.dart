import 'package:flutter/material.dart';

class LevinContainer extends StatefulWidget {
  final Offset offset;
  final Color? color;
  final Color shadowColor;
  final Color borderColor;
  final double? height;
  final double? width;
  final double borderWidth;
  final double shadowBlurRadius;
  final BlurStyle shadowBlurStyle;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;

  const LevinContainer({
    Key? key,
    this.offset = const Offset(4, 4),
    this.color,
    this.shadowColor = const Color(0xFF080808),
    this.borderColor = Colors.black,
    this.height,
    this.width,
    this.borderWidth = 3.0,
    this.shadowBlurRadius = 0.0,
    this.shadowBlurStyle = BlurStyle.solid,
    this.child,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<LevinContainer> createState() => LevinContainerState();
}

class LevinContainerState extends State<LevinContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor,
            blurRadius: widget.shadowBlurRadius,
            offset: widget.offset,
            blurStyle: widget.shadowBlurStyle,
          ),
        ],
        color: widget.color ?? theme.canvasColor,
      ),
      child: widget.child,
      clipBehavior: Clip.antiAlias,
    );
  }
}
