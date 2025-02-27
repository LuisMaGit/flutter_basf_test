import 'dart:convert';

class TrivialsNetworkServiceResponse {
  const TrivialsNetworkServiceResponse({this.responseCode, this.results});
  final int? responseCode;
  final List<TrivialsNetworkServiceResponseResults>? results;

  factory TrivialsNetworkServiceResponse.fromMap(Map<String, dynamic> map) {
    return TrivialsNetworkServiceResponse(
      responseCode: map['response_code'],
      results: map['results'] != null
          ? List<TrivialsNetworkServiceResponseResults>.from(
              (map['results']).map<TrivialsNetworkServiceResponseResults?>(
                (x) => TrivialsNetworkServiceResponseResults.fromMap(
                    x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory TrivialsNetworkServiceResponse.fromJson(String source) =>
      TrivialsNetworkServiceResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class TrivialsNetworkServiceResponseResults {
  const TrivialsNetworkServiceResponseResults({
    this.type,
    this.difficulty,
    this.category,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });
  final String? type;
  final String? difficulty;
  final String? category;
  final String? question;
  final String? correctAnswer;
  final List<String>? incorrectAnswers;

  factory TrivialsNetworkServiceResponseResults.fromMap(
    Map<String, dynamic> map,
  ) {
    return TrivialsNetworkServiceResponseResults(
      type: map['type'],
      difficulty: map['difficulty'],
      category: map['category'],
      question: map['question'],
      correctAnswer: map['correct_answer'],
      incorrectAnswers: map['incorrect_answers'] != null
          ? List<String>.from(
              (map['incorrect_answers']),
            )
          : null,
    );
  }
}
