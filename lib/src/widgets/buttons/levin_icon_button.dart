import 'package:flutter/material.dart';
import '_button.dart';

class LevinIconButton extends LevinButton {
  /// A customizable neubrutalist-style icon button.
  ///
  /// The button has an icon, customizable background color, border color,
  /// and drop shadow. The button's shape can also be customized with a rounded
  /// border radius. The button's behavior is specified with an `onPressed`
  /// callback function.
  ///
  /// This button is built using Flutter's `Material` widget, and is designed to
  /// follow the Neubrutalism UI style guidelines.
  LevinIconButton({
    Key? key,
    required enableAnimation,
    required this.icon,
    int animationDuration = 100,
    Color? borderColor,
    BorderRadius? borderRadius,
    double borderWidth = 3.0,
    Color? buttonColor,
    double height = 50,
    double width = 100,
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
          child: icon,
          enableAnimation: enableAnimation,
          key: key,
          offset: offset,
          onPressed: onPressed,
          shadowBlurRadius: shadowBlurRadius,
          shadowColor: shadowColor,
        );

  /// - icon (required) : A Icon Widget to help you add icons.
  final Icon icon;
}
