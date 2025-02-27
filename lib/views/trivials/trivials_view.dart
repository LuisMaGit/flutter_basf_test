import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core_ui/generic_view_state.dart';
import 'package:flutter_basf_test/core_ui/theme/b_spaces.dart';
import 'package:flutter_basf_test/core_ui/ui_helpers/trivials_ui_helper.dart';
import 'package:flutter_basf_test/core_ui/widgets/b_loader.dart';
import 'package:flutter_basf_test/core_ui/widgets/generic_error.dart';
import 'package:flutter_basf_test/core_ui/widgets/trivial_tile.dart';
import 'package:flutter_basf_test/core_ui/widgets/view_safe_wrapper.dart';
import 'package:flutter_basf_test/views/trivials/trivials_view_model.dart';
import 'package:provider/provider.dart';

class TrivialsView extends StatefulWidget {
  const TrivialsView({super.key});

  @override
  State<TrivialsView> createState() => _TrivialsViewState();
}

class _TrivialsViewState extends State<TrivialsView> {
  final vm = getTrivialsViewModel();

  @override
  void initState() {
    vm.initTrivialsView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewsSafeWrapper(
      child: ChangeNotifierProvider.value(
        value: vm,
        child: Consumer(
          builder: (context, _, __) => const _TrivialsBuilder(),
        ),
      ),
    );
  }
}

class _TrivialsBuilder extends StatelessWidget {
  const _TrivialsBuilder();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TrivialsViewModel>();
    return Builder(builder: (_) {
      switch (vm.state.genericState) {
        case GenericViewState.loading:
          return Center(
            child: BLoader(),
          );
        case GenericViewState.success:
          return const _Success();
        case GenericViewState.error:
          return Center(
            child: GenericError(
              tryAgain: vm.tryAgain,
            ),
          );
      }
    });
  }
}

class _Success extends StatelessWidget {
  const _Success();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TrivialsViewModel>();
    return ListView.builder(
      itemCount: vm.state.trivials.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final trivial = vm.state.trivials[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: bSize1),
          child: TrivialTile(
            color: TrivialsDifficultyColorHelper.getColorByDifficulty(
              trivial.difficulty,
            ),
            text: trivial.question,
            onTap: () => vm.goToTrivial(index),
          ),
        );
      },
    );
  }
}
