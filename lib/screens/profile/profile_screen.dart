import 'package:flutter/material.dart';

import '../../widgets/pending_section.dart';

/// Pantalla de Perfil — tarea de Luis (#5).
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PendingSection(
            owner: 'Luis',
            issue: '#5',
            todo: [
              'Mis pedidos (OrdersProvider): fecha, restaurante, platos y total',
              'Favoritos (FavoritesProvider): restaurantes con corazón',
              'Mensajes cuando no hay pedidos o favoritos',
            ],
          ),
        ],
      ),
    );
  }
}
