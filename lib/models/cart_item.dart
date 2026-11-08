import 'dish.dart';

/// Un plato dentro del carrito con su cantidad.
class CartItem {
  CartItem({required this.dish, this.quantity = 1});

  final Dish dish;
  int quantity;

  /// Precio del plato por la cantidad.
  int get subtotal => dish.price * quantity;
}
