import 'package:flutter_basf_test/core/models/trivial_difficulty.dart';
import 'package:flutter_basf_test/core/models/trivial_type.dart';

class TrivialModel {
  TrivialModel({
    required this.type,
    required this.difficulty,
    required this.question,
    required this.answers,
  });
  final TrivialType type;
  final TrivialDifficulty difficulty;
  final String question;
  final List<TrivialAnswersModel> answers;
}

class TrivialAnswersModel {
  // this model for questions type binary assumes the true option as first
  TrivialAnswersModel({
    required this.text,
    required this.isCorrect,
  });
  final String text;
  final bool isCorrect;


  factory TrivialAnswersModel.typeBinary({required bool isCorrect}) {
    return TrivialAnswersModel(isCorrect: isCorrect, text: '');
  }

}
