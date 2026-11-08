import 'package:flutter/material.dart';

import 'core/constants.dart';
import 'core/routes.dart';
import 'core/theme.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/main_shell.dart';
import 'screens/restaurant/restaurant_screen.dart';

/// Configuración de la app: tema y rutas.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.main,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.main:
            return MaterialPageRoute(builder: (_) => const MainShell());
          case AppRoutes.restaurant:
            final id = settings.arguments as String? ?? '';
            return MaterialPageRoute(
              builder: (_) => RestaurantScreen(restaurantId: id),
            );
          case AppRoutes.cart:
            return MaterialPageRoute(builder: (_) => const CartScreen());
          case AppRoutes.checkout:
            return MaterialPageRoute(builder: (_) => const CheckoutScreen());
        }
        return MaterialPageRoute(builder: (_) => const MainShell());
      },
    );
  }
}
