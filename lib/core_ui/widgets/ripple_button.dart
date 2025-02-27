import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  const RippleButton({
    required this.child,
    required this.onTap,
    super.key,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
