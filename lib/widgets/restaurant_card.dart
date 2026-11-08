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
                  // Wrap: si no cabe en una línea (celulares pequeños), baja a la siguiente.
                  Wrap(
                    spacing: 16,
                    runSpacing: 4,
                    children: [
                      _InfoChip(
                        icon: Icons.schedule,
                        text: '${restaurant.deliveryMinutes} min',
                      ),
                      _InfoChip(
                        icon: Icons.delivery_dining,
                        text: 'Domicilio ${formatPrice(restaurant.deliveryFee)}',
                      ),
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

/// Ícono pequeño con un texto gris (tiempo de entrega, domicilio).
class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.muted),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: AppColors.muted)),
      ],
    );
  }
}
