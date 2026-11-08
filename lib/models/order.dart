import 'cart_item.dart';

/// Un pedido ya enviado. Se guarda en `OrdersProvider` y se ve en Perfil.
class Order {
  const Order({
    required this.id,
    required this.date,
    required this.restaurantId,
    required this.restaurantName,
    required this.items,
    required this.deliveryFee,
    required this.customerName,
    required this.address,
    required this.phone,
    this.note = '',
  });

  final String id;
  final DateTime date;
  final String restaurantId;
  final String restaurantName;
  final List<CartItem> items;
  final int deliveryFee;
  final String customerName;
  final String address;
  final String phone;
  final String note;

  int get subtotal => items.fold(0, (sum, item) => sum + item.subtotal);

  int get total => subtotal + deliveryFee;

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
}
