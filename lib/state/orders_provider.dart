import 'package:flutter/foundation.dart';

import '../models/order.dart';

/// Pedidos que el usuario ya envió. Se llenan desde la pantalla de Pedido
/// y se muestran en Perfil > Mis pedidos.
class OrdersProvider extends ChangeNotifier {
  final List<Order> _orders = [];

  /// Pedidos del más reciente al más antiguo.
  List<Order> get orders => List.unmodifiable(_orders.reversed);

  bool get isEmpty => _orders.isEmpty;

  void add(Order order) {
    _orders.add(order);
    notifyListeners();
  }
}
