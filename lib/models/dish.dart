/// Un plato del menú de un restaurante.
class Dish {
  const Dish({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.section,
    required this.emoji,
    this.image,
  });

  final String id;
  final String restaurantId;
  final String name;
  final String description;

  /// Precio en pesos colombianos, sin decimales (ej: 18000).
  final int price;

  /// Sección del menú: 'Entradas', 'Platos fuertes', 'Bebidas' o 'Postres'.
  final String section;

  /// Emoji que se muestra mientras no haya foto.
  final String emoji;

  /// Ruta de la foto en assets/images (opcional).
  final String? image;
}
