enum TrivialType {
  unknown(''),
  binary('boolean'),
  multiple('multiple');

  const TrivialType(this.type);
  final String type;

  static TrivialType fromApi(String? type) {
    if (type == null) {
      return TrivialType.unknown;
    }

    for (var value in TrivialType.values) {
      if (value.type == type) {
        return value;
      }
    }

    return TrivialType.unknown;
  }
}
