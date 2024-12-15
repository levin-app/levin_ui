import 'package:flutter/material.dart';
import 'package:levin_ui/levin_ui.dart';

class LevinButton extends StatefulWidget {
  LevinButton({
    Key? key,
    required this.enableAnimation,
    this.buttonColor,
    this.shadowColor,
    this.borderColor,
    this.onPressed,
    this.borderRadius,
    this.offset = const Offset(4, 4),
    this.height = 100,
    this.width = 300,
    this.shadowBlurRadius = 0.0,
    this.borderWidth = 3.0,
    this.animationDuration = 100,
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  final Widget? child;
  final Color? buttonColor;
  final Color? shadowColor;
  final Color? borderColor;
  final GestureTapCallback? onPressed;
  final BorderRadius? borderRadius;
  final Offset offset;
  final double height;
  final double width;
  final double shadowBlurRadius;
  final double borderWidth;
  final bool enableAnimation;
  final int animationDuration;
  final EdgeInsets padding;

  @override
  State<LevinButton> createState() => LevinButtonState();
}

class LevinButtonState extends State<LevinButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    )..addListener(() {
        setState(() {});
      });
    _animation = Tween<Offset>(begin: const Offset(0, 0), end: widget.offset)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textButtonStyle = theme.textButtonTheme.style;

    return Padding(
      padding: widget.padding,
      child: InkWell(
        onTap: () {
          var doOnPressedAction = () => {
                if (widget.onPressed != null) {widget.onPressed!()}
              };

          if (widget.enableAnimation) {
            _controller.forward().then((value) {
              doOnPressedAction();
              _controller.reverse();
            });
          } else {
            doOnPressedAction();
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          child: LevinContainer(
            width: widget.width,
            height: widget.height,
            borderRadius: widget.borderRadius,
            color: widget.buttonColor ?? theme.primaryColor,
            borderColor: widget.borderColor ?? theme.primaryColorDark,
            borderWidth: widget.borderWidth,
            shadowColor: widget.shadowColor ?? theme.shadowColor,
            shadowBlurRadius: widget.shadowBlurRadius,
            offset: widget.offset - _animation.value,
            child: Center(
              child: DefaultTextStyle(
                style: textButtonStyle?.textStyle?.resolve({}) ?? TextStyle(),
                child: widget.child!,
              ),
            ),
          ),
          builder: (context, child) {
            return Transform.translate(
              offset: _animation.value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
