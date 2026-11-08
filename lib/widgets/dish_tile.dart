import 'package:flutter/material.dart';

import '../core/theme.dart';
import '../models/dish.dart';
import 'food_image.dart';
import 'price_text.dart';

/// Fila de un plato del menú con su botón para agregar.
///
/// ```dart
/// DishTile(
///   dish: plato,
///   quantity: cart.quantityOf(plato),
///   onAdd: () => context.read<CartProvider>().add(plato),
/// )
/// ```
class DishTile extends StatelessWidget {
  const DishTile({
    super.key,
    required this.dish,
    required this.onAdd,
    this.quantity = 0,
  });

  final Dish dish;
  final VoidCallback onAdd;

  /// Cuántos hay en el carrito; si es mayor que 0 se muestra en el botón.
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FoodImage(
            emoji: dish.emoji,
            image: dish.image,
            width: 72,
            height: 72,
            emojiSize: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dish.description,
                  style: const TextStyle(color: AppColors.muted, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                PriceText(dish.price, fontSize: 15),
              ],
            ),
          ),
          const SizedBox(width: 8),
          quantity > 0
              ? FilledButton.tonal(
                  onPressed: onAdd,
                  style: FilledButton.styleFrom(minimumSize: const Size(56, 40)),
                  child: Text('$quantity +'),
                )
              : IconButton.filled(
                  onPressed: onAdd,
                  tooltip: 'Agregar ${dish.name}',
                  icon: const Icon(Icons.add),
                ),
        ],
      ),
    );
  }
}
