import 'package:flutter/material.dart';

enum BIconType {
  favorite,
}

class BIcon extends StatelessWidget {
  const BIcon({
    super.key,
    required this.type,
    this.color,
    this.size = 16,
  });

  final BIconType type;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    IconData getIcon() {
      switch (type) {
        case BIconType.favorite:
          return Icons.favorite;
      }
    }

    return Icon(
      getIcon(),
      color: color,
      size: size,
    );
  }
}
