import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/routes.dart';
import '../../data/restaurants_data.dart';
import '../../widgets/pending_section.dart';
import '../../widgets/restaurant_card.dart';

/// Pantalla de Inicio — tarea de Santiago (#2).
/// Lo de abajo es temporal: muestra la lista sin buscador ni filtro
/// para que se pueda navegar mientras tanto.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const PendingSection(
            owner: 'Santiago',
            issue: '#2',
            todo: [
              'Saludo y buscador por nombre',
              'Filtro por categoría con chips',
              'Mensaje cuando no hay resultados',
            ],
          ),
          const SizedBox(height: 16),
          for (final restaurant in restaurants) ...[
            RestaurantCard(
              restaurant: restaurant,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.restaurant,
                arguments: restaurant.id,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
