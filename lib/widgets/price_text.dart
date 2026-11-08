import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/theme.dart';

/// Muestra un precio en pesos: `PriceText(25000)` -> "$ 25.000".
class PriceText extends StatelessWidget {
  const PriceText(
    this.value, {
    super.key,
    this.fontSize = 16,
    this.color = AppColors.primary,
    this.bold = true,
  });

  final int value;
  final double fontSize;
  final Color color;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      formatPrice(value),
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
      ),
    );
  }
}
