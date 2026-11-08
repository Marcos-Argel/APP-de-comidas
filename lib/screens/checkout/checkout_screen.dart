import 'package:flutter/material.dart';

import '../../widgets/pending_section.dart';

/// Pantalla de Pedido — tarea de Juan Padilla (#4).
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmar pedido')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PendingSection(
            owner: 'Juan Padilla',
            issue: '#4',
            todo: [
              'Formulario: nombre, dirección, teléfono y nota',
              'Validar los campos',
              'Abrir WhatsApp con el pedido (AppConstants.whatsappNumber)',
              'Guardar el pedido en OrdersProvider y vaciar el carrito',
            ],
          ),
        ],
      ),
    );
  }
}
