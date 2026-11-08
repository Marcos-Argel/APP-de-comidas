import 'package:flutter/material.dart';

import '../core/theme.dart';

/// Foto de un restaurante o plato. Si no hay foto (o no carga),
/// muestra el emoji sobre un fondo suave.
class FoodImage extends StatelessWidget {
  const FoodImage({
    super.key,
    required this.emoji,
    this.image,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.emojiSize = 40,
  });

  final String emoji;
  final String? image;
  final double? width;
  final double? height;
  final double borderRadius;
  final double emojiSize;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: width,
      height: height,
      color: AppColors.soft,
      alignment: Alignment.center,
      child: Text(emoji, style: TextStyle(fontSize: emojiSize)),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: image == null
          ? placeholder
          : Image.asset(
              image!,
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => placeholder,
            ),
    );
  }
}
