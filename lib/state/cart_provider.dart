import 'package:flutter/foundation.dart';

import '../data/restaurants_data.dart';
import '../models/cart_item.dart';
import '../models/dish.dart';
import '../models/restaurant.dart';

/// Carrito de compras. Solo admite platos de un restaurante a la vez,
/// porque cada pedido lo entrega un solo restaurante.
///
/// Uso en una pantalla:
/// ```dart
/// final cart = context.watch<CartProvider>();    // para mostrar datos
/// context.read<CartProvider>().add(dish);        // para cambiar datos
/// ```
class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  bool get isEmpty => _items.isEmpty;

  /// Restaurante de los platos que hay en el carrito (null si está vacío).
  Restaurant? get restaurant =>
      _items.isEmpty ? null : findRestaurant(_items.first.dish.restaurantId);

  /// Número total de platos (sumando cantidades).
  int get count => _items.fold(0, (sum, item) => sum + item.quantity);

  int get subtotal => _items.fold(0, (sum, item) => sum + item.subtotal);

  int get deliveryFee => restaurant?.deliveryFee ?? 0;

  int get total => subtotal + deliveryFee;

  /// Cantidad de un plato en el carrito (0 si no está).
  int quantityOf(Dish dish) {
    for (final item in _items) {
      if (item.dish.id == dish.id) return item.quantity;
    }
    return 0;
  }

  /// true si el plato es de otro restaurante distinto al del carrito.
  bool isFromAnotherRestaurant(Dish dish) =>
      _items.isNotEmpty && _items.first.dish.restaurantId != dish.restaurantId;

  /// Agrega un plato. Si es de otro restaurante, primero vacía el carrito.
  void add(Dish dish) {
    if (isFromAnotherRestaurant(dish)) _items.clear();
    for (final item in _items) {
      if (item.dish.id == dish.id) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(dish: dish));
    notifyListeners();
  }

  /// Quita una unidad del plato. Si llega a 0, lo saca del carrito.
  void decrease(Dish dish) {
    for (final item in _items) {
      if (item.dish.id == dish.id) {
        item.quantity--;
        if (item.quantity <= 0) _items.remove(item);
        notifyListeners();
        return;
      }
    }
  }

  /// Saca el plato del carrito sin importar la cantidad.
  void remove(Dish dish) {
    _items.removeWhere((item) => item.dish.id == dish.id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
