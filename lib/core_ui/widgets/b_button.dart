import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core_ui/theme/b_colors.dart';
import 'package:flutter_basf_test/core_ui/theme/b_spaces.dart';
import 'package:flutter_basf_test/core_ui/widgets/b_text.dart';
import 'package:flutter_basf_test/core_ui/widgets/ripple_button.dart';

class BTextButton extends StatelessWidget {
  const BTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = BColors.primary,
    this.colorText = BColors.background,
  });

  final Color color;
  final Color colorText;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RippleButton(
      onTap: onTap,
      child: Container(
        color: color,
        padding: const EdgeInsets.all(bSize2),
        child: BText.medium(
          text,
          color: colorText,
        ),
      ),
    );
  }
}
