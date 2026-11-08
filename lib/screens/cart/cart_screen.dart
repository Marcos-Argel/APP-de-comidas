import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes.dart';
import '../../state/cart_provider.dart';
import '../../widgets/app_button.dart';
import '../../widgets/pending_section.dart';
import '../../widgets/price_text.dart';

/// Pantalla de Carrito — tarea de Juan Padilla (#4).
/// Lo de abajo es temporal: muestra el total para poder seguir al pedido.
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const PendingSection(
            owner: 'Juan Padilla',
            issue: '#4',
            todo: [
              'Lista de platos con botones + y −',
              'Subtotal, domicilio y total',
              'Mensaje de carrito vacío',
            ],
          ),
          const SizedBox(height: 16),
          if (cart.isEmpty)
            const Text('Tu carrito está vacío.')
          else ...[
            Text('${cart.restaurant?.name} · ${cart.count} platos'),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Total: ', style: TextStyle(fontSize: 18)),
                PriceText(cart.total, fontSize: 18),
              ],
            ),
            const SizedBox(height: 16),
            AppButton(
              label: 'Continuar con el pedido',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.checkout),
            ),
          ],
        ],
      ),
    );
  }
}
