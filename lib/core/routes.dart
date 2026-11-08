/// Nombres de las pantallas. Para abrir una pantalla:
///
/// ```dart
/// Navigator.pushNamed(context, AppRoutes.cart);
/// Navigator.pushNamed(context, AppRoutes.restaurant, arguments: restaurante.id);
/// ```
class AppRoutes {
  AppRoutes._();

  /// Pantalla principal con la barra inferior (Inicio, Carrito y Perfil).
  static const String main = '/';

  /// Detalle de un restaurante. Recibe el `id` del restaurante en `arguments`.
  static const String restaurant = '/restaurante';

  /// Carrito de compras.
  static const String cart = '/carrito';

  /// Formulario para confirmar el pedido.
  static const String checkout = '/pedido';
}
