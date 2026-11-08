import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'state/cart_provider.dart';
import 'state/favorites_provider.dart';
import 'state/orders_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ],
      child: const App(),
    ),
  );
}
