enum TrivialDifficulty {
  unknown(''),
  easy('easy'),
  medium('medium'),
  hard('hard');

  const TrivialDifficulty(this.type);
  final String type;

  static TrivialDifficulty fromApi(String? type) {
    if (type == null) {
      return TrivialDifficulty.unknown;
    }

    for (var value in TrivialDifficulty.values) {
      if (value.type == type) {
        return value;
      }
    }

    return TrivialDifficulty.unknown;
  }
}