import 'package:app_de_comidas/app.dart';
import 'package:app_de_comidas/core/constants.dart';
import 'package:app_de_comidas/data/restaurants_data.dart';
import 'package:app_de_comidas/state/cart_provider.dart';
import 'package:app_de_comidas/state/favorites_provider.dart';
import 'package:app_de_comidas/state/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget buildApp() => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ],
      child: const App(),
    );

void main() {
  test('formatPrice escribe pesos con puntos', () {
    expect(formatPrice(0), r'$ 0');
    expect(formatPrice(5000), r'$ 5.000');
    expect(formatPrice(25000), r'$ 25.000');
    expect(formatPrice(1250000), r'$ 1.250.000');
  });

  test('cada restaurante tiene 5 platos con id único', () {
    expect(restaurants.length, greaterThanOrEqualTo(6));
    final ids = <String>{};
    for (final restaurant in restaurants) {
      expect(restaurant.dishes.length, greaterThanOrEqualTo(5));
      for (final dish in restaurant.dishes) {
        expect(dish.restaurantId, restaurant.id);
        expect(ids.add(dish.id), isTrue, reason: 'id repetido: ${dish.id}');
      }
    }
  });

  test('el carrito suma, resta y usa un solo restaurante', () {
    final cart = CartProvider();
    final first = restaurants[0].dishes[0];
    final second = restaurants[0].dishes[1];
    final other = restaurants[1].dishes[0];

    cart.add(first);
    cart.add(first);
    cart.add(second);
    expect(cart.count, 3);
    expect(cart.subtotal, first.price * 2 + second.price);
    expect(cart.total, cart.subtotal + restaurants[0].deliveryFee);

    cart.decrease(first);
    expect(cart.quantityOf(first), 1);

    expect(cart.isFromAnotherRestaurant(other), isTrue);
    cart.add(other);
    expect(cart.count, 1);
    expect(cart.restaurant?.id, restaurants[1].id);
  });

  test('favoritos se marcan y desmarcan', () {
    final favorites = FavoritesProvider();
    favorites.toggle('burger-uraba');
    expect(favorites.isFavorite('burger-uraba'), isTrue);
    expect(favorites.favoriteRestaurants.single.id, 'burger-uraba');
    favorites.toggle('burger-uraba');
    expect(favorites.favoriteRestaurants, isEmpty);
  });

  testWidgets('se navega de Inicio al restaurante, al carrito y al pedido',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildApp());
    expect(find.text(AppConstants.appName), findsOneWidget);
    expect(find.text('Inicio'), findsOneWidget);

    await tester.tap(find.text(restaurants[0].name));
    await tester.pumpAndSettle();
    expect(find.text(restaurants[0].dishes[0].name), findsOneWidget);

    await tester.tap(find.byTooltip('Agregar ${restaurants[0].dishes[0].name}'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ver carrito (1)'));
    await tester.pumpAndSettle();
    expect(find.text('Continuar con el pedido'), findsOneWidget);

    await tester.tap(find.text('Continuar con el pedido'));
    await tester.pumpAndSettle();
    expect(find.text('Confirmar pedido'), findsOneWidget);
  });

  testWidgets('la barra inferior cambia a Carrito y Perfil', (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();
    expect(find.textContaining('Luis'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Tu carrito está vacío.'), findsOneWidget);
  });
}
