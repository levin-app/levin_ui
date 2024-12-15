import 'package:flutter/material.dart';
import 'package:levin_ui/levin_ui.dart';

class LevinTextField extends StatefulWidget {
  /// A customizable neubrutalist-style Text Field.
  ///
  /// The Text Field has customizable keyboardType, inputStyle, hintText,
  /// hintStyle, height, width, and other properties.
  ///
  /// This Text Field is built using Flutter's `Material` widget, and is designed to
  /// follow the Levinbrutalism UI style guidelines.
  LevinTextField({
    Key? key,
    this.keyboardType,
    this.inputStyle,
    this.hintText,
    this.controller,
    this.hintStyle,
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(8.0),
    this.borderWidth = 1.5,
    this.shadowBlurRadius = 0.0,
    this.shadowOffset = const Offset(4, 4),
    this.borderRadius,
    this.borderColor = Colors.black,
    this.backgroundColor,
    this.shadowColor = const Color(0xFF080808),
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  final TextInputType? keyboardType;
  final TextStyle? inputStyle;
  final String? hintText;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final double? height;
  final double? width;
  final double borderWidth;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final BorderRadius? borderRadius;
  final Color borderColor;
  final Color? backgroundColor;
  final Color shadowColor;
  final EdgeInsetsGeometry padding;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  State<LevinTextField> createState() => _LevinTextFieldState();
}

class _LevinTextFieldState extends State<LevinTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: widget.padding,
      child: LevinContainer(
        height: widget.height,
        width: widget.width ?? 300,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
        color: widget.backgroundColor ?? theme.canvasColor,
        borderColor: widget.borderColor,
        borderWidth: widget.borderWidth,
        shadowColor: widget.shadowColor,
        shadowBlurRadius: widget.shadowBlurRadius,
        offset: widget.shadowOffset,
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          style: widget.inputStyle,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          validator: widget.validator,
        ),
      ),
    );
  }
}
