import 'dish.dart';

/// Un restaurante con su menú.
class Restaurant {
  const Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.address,
    required this.rating,
    required this.deliveryMinutes,
    required this.deliveryFee,
    required this.emoji,
    required this.dishes,
    this.image,
  });

  final String id;
  final String name;

  /// Categoría para el filtro de Inicio (ver `categories` en restaurants_data.dart).
  final String category;
  final String description;
  final String address;

  /// Calificación de 1 a 5 (ej: 4.7).
  final double rating;

  /// Tiempo de entrega aproximado en minutos.
  final int deliveryMinutes;

  /// Costo del domicilio en pesos.
  final int deliveryFee;

  /// Emoji que se muestra mientras no haya foto.
  final String emoji;
  final List<Dish> dishes;

  /// Ruta de la foto en assets/images (opcional).
  final String? image;

  /// Secciones del menú en el orden en que aparecen.
  List<String> get sections {
    final result = <String>[];
    for (final dish in dishes) {
      if (!result.contains(dish.section)) result.add(dish.section);
    }
    return result;
  }

  /// Platos de una sección del menú.
  List<Dish> dishesOf(String section) =>
      dishes.where((dish) => dish.section == section).toList();
}
