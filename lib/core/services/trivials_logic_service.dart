import 'package:flutter_basf_test/core/models/trivial_difficulty.dart';
import 'package:flutter_basf_test/core/models/trivial_model.dart';
import 'package:flutter_basf_test/core/models/trivial_type.dart';
import 'package:flutter_basf_test/core/services/trivials_network_service/trivials_network_sevice.dart';

TrivialsLogicService getTrivialsLogicService({
  TrivialsNetworkSevice? trivialNetworkService,
}) {
  return TrivialsLogicService(
    trivialNetworkService: trivialNetworkService ?? getTrivialsNetworkSevice(),
  );
}

class TrivialsLogicService {
  const TrivialsLogicService({
    required this.trivialNetworkService,
  });

  final TrivialsNetworkSevice trivialNetworkService;

  List<TrivialAnswersModel> _convertNetworkAnswers({
    required List<String> incorrect,
    required String correct,
    required TrivialType type,
  }) {
    if (incorrect.isEmpty || correct.isEmpty) {
      return [];
    }

    if (type == TrivialType.binary) {
      return correct == 'True'
          ? [
              TrivialAnswersModel.typeBinary(isCorrect: true),
              TrivialAnswersModel.typeBinary(isCorrect: false),
            ]
          : [
              TrivialAnswersModel.typeBinary(isCorrect: false),
              TrivialAnswersModel.typeBinary(isCorrect: true),
            ];
    }

    final multipleGame = List.generate(
      incorrect.length + 1,
      (index) {
        if (index == incorrect.length) {
          return TrivialAnswersModel(
            isCorrect: true,
            text: correct,
          );
        }

        return TrivialAnswersModel(
          isCorrect: false,
          text: incorrect[index],
        );
      },
    );

    multipleGame.shuffle();
    return multipleGame;
  }

  Future<List<TrivialModel>?> getTrivials() async {
    final networkReponse = await trivialNetworkService.getTrivials();
    if (networkReponse == null) {
      return null;
    }

    final trivials = <TrivialModel>[];
    for (var net in networkReponse) {
      final type = TrivialType.fromApi(net.type);
      trivials.add(
        TrivialModel(
          type: type,
          difficulty: TrivialDifficulty.fromApi(net.difficulty),
          question: net.question ?? '',
          answers: _convertNetworkAnswers(
            incorrect: net.incorrectAnswers ?? [],
            correct: net.correctAnswer ?? '',
            type: type,
          ),
        ),
      );
    }

    return trivials;
  }
}
