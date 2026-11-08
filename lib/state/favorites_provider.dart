import 'package:flutter/foundation.dart';

import '../data/restaurants_data.dart' as data;
import '../models/restaurant.dart';

/// Restaurantes marcados como favoritos (el corazón).
class FavoritesProvider extends ChangeNotifier {
  final Set<String> _ids = {};

  bool isFavorite(String restaurantId) => _ids.contains(restaurantId);

  /// Marca o desmarca un restaurante como favorito.
  void toggle(String restaurantId) {
    if (!_ids.remove(restaurantId)) _ids.add(restaurantId);
    notifyListeners();
  }

  /// Restaurantes favoritos, en el mismo orden de la lista de Inicio.
  List<Restaurant> get favoriteRestaurants =>
      data.restaurants.where((r) => _ids.contains(r.id)).toList();
}
