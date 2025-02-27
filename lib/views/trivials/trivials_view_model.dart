import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core/services/navigation_service/navigation_service.dart';
import 'package:flutter_basf_test/core/services/navigation_service/routes.dart';
import 'package:flutter_basf_test/core/services/trivials_logic_service.dart';
import 'package:flutter_basf_test/core_ui/generic_view_state.dart';
import 'package:flutter_basf_test/views/trivials/trivials_state.dart';

TrivialsViewModel getTrivialsViewModel({
  TrivialsLogicService? trivialsLogicService,
  TrivialsState? initState,
  NavigationService? navigationService,
}) {
  return TrivialsViewModel(
    initState: initState ?? TrivialsState(),
    trivialsLogicService: trivialsLogicService ?? getTrivialsLogicService(),
    navigationService: navigationService ?? getNavigationService(),
  );
}

class TrivialsViewModel extends ChangeNotifier {
  TrivialsViewModel({
    required TrivialsState initState,
    required this.trivialsLogicService,
    required this.navigationService,
  }) {
    _state = initState;
  }

  final TrivialsLogicService trivialsLogicService;
  final NavigationService navigationService;

  late TrivialsState _state;
  TrivialsState get state => _state;

  // events
  Future<void> initTrivialsView() async {
    final response = await trivialsLogicService.getTrivials();

    if (response == null || response.isEmpty) {
      _state = _state.copyWith(
        genericState: GenericViewState.error,
      );
      notifyListeners();
      return;
    }

    _state = _state.copyWith(
      trivials: response,
      genericState: GenericViewState.success,
    );
    notifyListeners();
  }

  Future<void> tryAgain() async {
    _state = _state.copyWith(
      genericState: GenericViewState.loading,
    );
    notifyListeners();

    await initTrivialsView();
  }

  void goToTrivial(int idx) {
    navigationService.goTo(Routes.trivial);
  }
}
