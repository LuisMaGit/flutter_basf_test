import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core_ui/theme/b_colors.dart';

enum TextStyleType {
  big,
  medium,
  small,
}

class BText extends StatelessWidget {
  const BText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
    required this.styleType,
  });

  const BText.big(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
  }) : styleType = TextStyleType.big;

  const BText.medium(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
  }) : styleType = TextStyleType.medium;

  const BText.small(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
  }) : styleType = TextStyleType.small;

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextStyleType styleType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    TextStyle getStyle() {
      switch (styleType) {
        case TextStyleType.small:
          return TextStyle(
            color: color ?? BColors.textColor,
            fontSize: fontSize ?? 12,
          );
        case TextStyleType.medium:
          return TextStyle(
            color: color ?? BColors.textColor,
            fontSize: fontSize ?? 16,
          );
        case TextStyleType.big:
          return TextStyle(
            color: color ?? BColors.textColor,
            fontSize: fontSize ?? 20,
          );
      }
    }

    return Text(
      text,
      maxLines: maxLines,
      style: getStyle(),
    );
  }
}
