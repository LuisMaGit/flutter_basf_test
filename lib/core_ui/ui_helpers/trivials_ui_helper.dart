import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core/models/trivial_difficulty.dart';
import 'package:flutter_basf_test/core_ui/theme/b_colors.dart';

abstract class TrivialsDifficultyColorHelper {
 static Color getColorByDifficulty(TrivialDifficulty difficulty) {
    switch (difficulty) {
      case TrivialDifficulty.hard:
        return BColors.hardQuestion;
      case TrivialDifficulty.medium:
        return BColors.mediumQuestion;
      case TrivialDifficulty.easy:
        return BColors.easyQuestion;

      default:
        return BColors.background;
    }
  }
}
