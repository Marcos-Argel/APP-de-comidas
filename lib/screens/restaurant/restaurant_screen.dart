import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes.dart';
import '../../data/restaurants_data.dart';
import '../../state/cart_provider.dart';
import '../../widgets/app_button.dart';
import '../../widgets/dish_tile.dart';
import '../../widgets/pending_section.dart';

/// Pantalla de Restaurante y menú — tarea de Juan Parra (#3).
/// Recibe el id del restaurante en `arguments`.
/// Lo de abajo es temporal: muestra el menú simple para poder probar el carrito.
class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final restaurant = findRestaurant(restaurantId);
    if (restaurant == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Restaurante no encontrado')),
      );
    }

    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const PendingSection(
            owner: 'Juan Parra',
            issue: '#3',
            todo: [
              'Encabezado con foto, calificación, tiempo y domicilio',
              'Botón de favorito (corazón)',
              'Menú agrupado por secciones',
              'Barra inferior "Ver carrito"',
            ],
          ),
          const SizedBox(height: 8),
          for (final dish in restaurant.dishes)
            DishTile(
              dish: dish,
              quantity: cart.quantityOf(dish),
              onAdd: () => context.read<CartProvider>().add(dish),
            ),
        ],
      ),
      bottomNavigationBar: cart.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AppButton(
                  label: 'Ver carrito (${cart.count})',
                  icon: Icons.shopping_bag,
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
                ),
              ),
            ),
    );
  }
}
