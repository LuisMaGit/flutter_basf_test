import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core_ui/theme/b_colors.dart';
import 'package:flutter_basf_test/core_ui/theme/b_spaces.dart';
import 'package:flutter_basf_test/core_ui/widgets/b_icon.dart';
import 'package:flutter_basf_test/core_ui/widgets/b_text.dart';
import 'package:flutter_basf_test/core_ui/widgets/ripple_button.dart';

class TrivialTile extends StatelessWidget {
  const TrivialTile({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
    this.onTapFavorite,
  });

  final Color color;
  final String text;
  final VoidCallback? onTapFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Widget onlyTitle() {
      return RippleButton(
        onTap: onTap,
        child: Container(
          color: color,
          height: 60,
          padding: const EdgeInsets.symmetric(
            vertical: bSize1,
            horizontal: bSize2,
          ),
          child: BText.medium(
            text,
            color: BColors.background,
            maxLines: 2,
          ),
        ),
      );
    }

    Widget withFavoriteOption() {
      return Row(
        spacing: bSize2,
        children: [
          Expanded(child: onlyTitle()),
          RippleButton(
            onTap: onTapFavorite!,
            child: Padding(
              padding: EdgeInsets.all(bSize1),
              child: BIcon(type: BIconType.favorite),
            ),
          ),
        ],
      );
    }

    return onTapFavorite == null ? onlyTitle() : withFavoriteOption();
  }
}
