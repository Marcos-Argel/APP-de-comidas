import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/theme.dart';
import '../models/restaurant.dart';
import 'food_image.dart';

/// Tarjeta de un restaurante para listas (Inicio y Favoritos).
///
/// ```dart
/// RestaurantCard(
///   restaurant: restaurante,
///   onTap: () => Navigator.pushNamed(context, AppRoutes.restaurant, arguments: restaurante.id),
/// )
/// ```
class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
    this.trailing,
  });

  final Restaurant restaurant;
  final VoidCallback onTap;

  /// Widget opcional arriba a la derecha (por ejemplo, el corazón de favorito).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                FoodImage(
                  emoji: restaurant.emoji,
                  image: restaurant.image,
                  width: double.infinity,
                  height: 140,
                  borderRadius: 0,
                  emojiSize: 56,
                ),
                if (trailing != null)
                  Positioned(top: 8, right: 8, child: trailing!),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ink,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.star_rounded, color: AppColors.star, size: 20),
                      const SizedBox(width: 2),
                      Text(
                        restaurant.rating.toStringAsFixed(1),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    restaurant.category,
                    style: const TextStyle(color: AppColors.muted),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 16, color: AppColors.muted),
                      const SizedBox(width: 4),
                      Text('${restaurant.deliveryMinutes} min',
                          style: const TextStyle(color: AppColors.muted)),
                      const SizedBox(width: 16),
                      const Icon(Icons.delivery_dining, size: 18, color: AppColors.muted),
                      const SizedBox(width: 4),
                      Text('Domicilio ${formatPrice(restaurant.deliveryFee)}',
                          style: const TextStyle(color: AppColors.muted)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
