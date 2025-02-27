import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core/services/navigation_service/navigation_service.dart';
import 'package:flutter_basf_test/core/services/navigation_service/router.dart';
import 'package:flutter_basf_test/core_ui/theme/b_colors.dart';
import 'package:flutter_basf_test/core_ui/theme/b_labels.dart';
import 'package:flutter_basf_test/views/trivials/trivials_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = getNavigationService();
    return MaterialApp(
      title: BLabels.genericError,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigator.navigatorKey,
      theme: ThemeData(
        canvasColor: BColors.background,
        scaffoldBackgroundColor: BColors.background,
      ),
      home: TrivialsView(),
    );
  }
}
