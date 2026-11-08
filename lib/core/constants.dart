/// Datos fijos de la app.
class AppConstants {
  AppConstants._();

  static const String appName = 'Urabá Domicilios';

  /// Número de WhatsApp que recibe los pedidos.
  /// Formato internacional, solo dígitos y sin + (57 = Colombia).
  static const String whatsappNumber = '573155400005';

  /// Pedido mínimo en pesos.
  static const int minimumOrder = 10000;
}

/// Convierte un número a pesos colombianos: 25000 -> "$ 25.000".
String formatPrice(int value) {
  final digits = value.abs().toString();
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    final remaining = digits.length - i;
    buffer.write(digits[i]);
    if (remaining > 1 && remaining % 3 == 1) {
      buffer.write('.');
    }
  }
  return '${value < 0 ? '-' : ''}\$ $buffer';
}
