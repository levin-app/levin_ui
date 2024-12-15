import 'package:flutter/material.dart';
import 'package:levin_ui/levin_ui.dart';

class LevinSearchBar extends StatefulWidget {
  LevinSearchBar({
    Key? key,
    this.keyboardType,
    this.inputStyle,
    this.hintText,
    this.searchController,
    this.hintStyle,
    this.searchBarHeight,
    this.searchBarWidth,
    this.borderWidth = 3.0,
    this.shadowBlurRadius = 0.0,
    this.leadingIcon,
    this.shadowOffset = const Offset(4, 4),
    this.borderRadius,
    this.borderColor = Colors.black,
    this.searchBarColor,
    this.shadowColor = const Color(0xFF080808),
  }) : super(key: key);

  final TextInputType? keyboardType;
  final TextStyle? inputStyle;
  final String? hintText;
  final TextEditingController? searchController;
  final TextStyle? hintStyle;
  final double? searchBarHeight;
  final double? searchBarWidth;
  final double borderWidth;
  final double shadowBlurRadius;
  final Icon? leadingIcon;
  final Offset shadowOffset;
  final BorderRadiusGeometry? borderRadius;
  final Color borderColor;
  final Color? searchBarColor;
  final Color shadowColor;

  @override
  State<LevinSearchBar> createState() => _LevinSearchBarState();
}

class _LevinSearchBarState extends State<LevinSearchBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LevinContainer(
      height: widget.searchBarHeight,
      width: widget.searchBarWidth ?? 300,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
      color: widget.searchBarColor ?? theme.canvasColor,
      borderColor: widget.borderColor,
      borderWidth: widget.borderWidth,
      shadowColor: widget.shadowColor,
      shadowBlurRadius: widget.shadowBlurRadius,
      offset: widget.shadowOffset,
      child: Row(
        children: [
          SizedBox(width: 6),
          widget.leadingIcon ?? Icon(Icons.search),
          SizedBox(width: 13),
          Expanded(
            child: TextField(
              controller: widget.searchController,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.hintStyle,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: widget.inputStyle,
              keyboardType: widget.keyboardType,
            ),
          ),
        ],
      ),
    );
  }
}
