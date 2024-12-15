import 'package:flutter/material.dart';
import '_button.dart';

class LevinTextButton extends LevinButton {
  LevinTextButton({
    Key? key,
    required this.text,
    bool enableAnimation = true,
    int animationDuration = 100,
    Color? borderColor,
    BorderRadius? borderRadius,
    double borderWidth = 3.0,
    Color? buttonColor,
    double height = 50,
    double width = 300,
    Offset offset = const Offset(4, 4),
    GestureTapCallback? onPressed,
    double shadowBlurRadius = 0.0,
    Color? shadowColor,
  }) : super(
          animationDuration: animationDuration,
          borderColor: borderColor,
          borderRadius: borderRadius,
          borderWidth: borderWidth,
          buttonColor: buttonColor,
          height: height,
          width: width,
          child: text,
          enableAnimation: enableAnimation,
          key: key,
          offset: offset,
          onPressed: onPressed,
          shadowBlurRadius: shadowBlurRadius,
          shadowColor: shadowColor,
        );

  final Text text;
}
