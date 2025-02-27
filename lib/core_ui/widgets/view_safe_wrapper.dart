import 'package:flutter/material.dart';

class ViewsSafeWrapper extends StatelessWidget {
  const ViewsSafeWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: child,
      ),
    );
  }
}
