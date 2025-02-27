import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core_ui/theme/b_colors.dart';

class BLoader extends StatelessWidget {
  const BLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(BColors.textColor),
    );
  }
}
