import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core_ui/theme/b_labels.dart';
import 'package:flutter_basf_test/core_ui/theme/b_spaces.dart';
import 'package:flutter_basf_test/core_ui/widgets/b_button.dart';
import 'package:flutter_basf_test/core_ui/widgets/b_text.dart';

class GenericError extends StatelessWidget {
  const GenericError({
    super.key,
    required this.tryAgain,
  });

  final VoidCallback tryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: bSize3,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BText.big(BLabels.genericError),
        BTextButton(
          text: BLabels.genericErrorButton,
          onTap: tryAgain,
        )
      ],
    );
  }
}
