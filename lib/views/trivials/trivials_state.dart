import 'package:flutter_basf_test/core/models/trivial_model.dart';
import 'package:flutter_basf_test/core_ui/generic_view_state.dart';

class TrivialsState {
  const TrivialsState({
    this.trivials = const [],
    this.genericState = GenericViewState.loading,
  });
  final List<TrivialModel> trivials;
  final GenericViewState genericState;

  TrivialsState copyWith({
    List<TrivialModel>? trivials,
    GenericViewState? genericState,
  }) {
    return TrivialsState(
      trivials: trivials ?? this.trivials,
      genericState: genericState ?? this.genericState,
    );
  }
}
