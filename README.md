# APP de Comidas — Domicilios

App de domicilios de varios restaurantes para **Android y web**, hecha con **Flutter**.
El usuario ve los restaurantes, entra al menú de cada uno, arma su carrito y hace el pedido.

## Funciones de la app

- **Inicio:** lista de restaurantes con foto, categoría, calificación y tiempo de entrega; buscador y filtro por categoría.
- **Restaurante:** información del local y su menú de platos con precio.
- **Carrito:** agregar y quitar platos, cambiar cantidades y ver el total.
- **Pedido:** formulario con nombre, dirección y teléfono; el pedido se envía por WhatsApp al restaurante.
- **Cuenta:** iniciar sesión y registrarse con correo y contraseña (Firebase).
- **Perfil:** datos del usuario, mis pedidos, restaurantes favoritos y cerrar sesión.

## Cómo correr el proyecto

Necesitas **Flutter 3.24 o superior** ([instalar Flutter](https://docs.flutter.dev/get-started/install)), **Git** y **Android Studio** (para el emulador) o un celular Android con depuración USB.

```bash
git clone https://github.com/Marcos-Argel/APP-de-comidas.git
cd APP-de-comidas
flutter pub get
flutter run -d chrome     # en el navegador
flutter run               # en el emulador o celular Android
```

Para revisar que todo esté instalado: `flutter doctor`.

**La primera vez** que clones el repo, si no ves las carpetas `android/` y `web/`, créalas con:

```bash
flutter create --platforms android,web --org com.urabadev --project-name app_de_comidas .
```

Ese comando solo agrega lo que falta; no cambia el código de `lib/`.

## Estructura de carpetas

```
APP-de-comidas/
├── android/                     # Proyecto Android (lo genera Flutter)
├── web/                         # Proyecto web (lo genera Flutter)
├── assets/
│   └── images/                  # Fotos de restaurantes y platos
├── lib/
│   ├── main.dart                # Arranca la app
│   ├── app.dart                 # MaterialApp: tema y rutas
│   ├── core/
│   │   ├── theme.dart           # Colores y tipografía
│   │   ├── routes.dart          # Nombres de las pantallas
│   │   └── constants.dart       # Número de WhatsApp, textos fijos
│   ├── models/
│   │   ├── restaurant.dart      # Restaurante
│   │   ├── dish.dart            # Plato
│   │   ├── cart_item.dart       # Plato + cantidad
│   │   └── order.dart           # Pedido
│   ├── data/
│   │   └── restaurants_data.dart  # Restaurantes y menús de ejemplo
│   ├── state/
│   │   ├── cart_provider.dart     # Carrito (provider)
│   │   ├── favorites_provider.dart  # Restaurantes favoritos
│   │   └── orders_provider.dart     # Pedidos enviados
│   ├── widgets/                 # Piezas que usa todo el equipo
│   │   ├── restaurant_card.dart
│   │   ├── dish_tile.dart
│   │   ├── app_button.dart
│   │   ├── price_text.dart
│   │   ├── food_image.dart      # Foto o emoji del plato
│   │   └── pending_section.dart # Aviso de pantalla pendiente
│   └── screens/                 # Una carpeta por pantalla
│       ├── main_shell.dart      # Barra inferior: Inicio, Carrito, Perfil
│       ├── home/                # Santiago
│       ├── restaurant/          # Juan Parra
│       ├── cart/                # Juan Padilla
│       ├── checkout/            # Juan Padilla
│       ├── auth/                # Luis (login y registro)
│       └── profile/             # Luis (pedidos y favoritos)
├── test/                        # Pruebas (flutter test)
├── .github/workflows/           # Revisión automática en cada subida
├── pubspec.yaml                 # Dependencias
└── README.md
```

## Equipo, ramas y tareas

| Integrante | Rama | Tarea | Fecha |
| --- | --- | --- | --- |
| Marcos Argel | `marcos` | **1.** Proyecto base: `flutter create`, tema, rutas, modelos, datos de ejemplo y widgets compartidos (#1) — líder | 11 nov |
| Santiago Cogollo | `santiago` | **2.** Pantalla de Inicio: lista de restaurantes, buscador y filtro (#2) | 20 nov |
| Juan Pablo Parra | `juan-parra` | **2.** Pantalla de Restaurante y menú de platos (#3) | 20 nov |
| Juan Pablo Padilla | `juan-padilla` | **3.** Carrito y pedido por WhatsApp (#4) | 24 nov |
| Luis Vergara | `luis` | **2.** Login y registro con Firebase (#10) | 22 nov |
| Luis Vergara | `luis` | **3.** Perfil: mis pedidos y favoritos (#5) | 24 nov |
| Marcos Argel | `marcos` | **4.** Revisión final, APK de Android y web publicada (#6) | 1 dic |

**Orden de trabajo:**
1. **Marcos sube primero la estructura base** (#1). Las demás pantallas usan sus modelos, datos y widgets.
2. Cuando la estructura entre a `main`, cada uno actualiza su rama (`git checkout SU_RAMA` y `git pull origin main`) y hace su pantalla: primero Inicio y Restaurante, después Carrito y Perfil.
3. Al final, Marcos revisa todo, genera el APK y publica la web.

Mientras la estructura no esté en `main`, cada uno puede ir diseñando su pantalla en papel o en Figma.

## Diseño: la app debe verse elegante

Todo el equipo cumple esta lista en su pantalla antes de abrir el PR:

- [ ] Solo colores de `AppColors` y el tema de `core/theme.dart` (nada de `Colors.red` sueltos).
- [ ] Bordes redondeados (12–16), espacios en múltiplos de 8 y sombras suaves.
- [ ] Textos con jerarquía: títulos grandes en negrita, textos secundarios en `AppColors.muted`.
- [ ] Usar los widgets compartidos (`AppButton`, `RestaurantCard`, `DishTile`, `PriceText`, `FoodImage`).
- [ ] Estados vacíos y de error con ícono, mensaje claro y un botón para seguir.
- [ ] Animaciones suaves donde ayuden (transiciones, `AnimatedSwitcher`, `Hero` en fotos).
- [ ] Se ve bien en celular (360 px) y en web ancha (contenido centrado, máximo ~600 px).
- [ ] Sin franjas amarillas y negras de desborde (overflow) ni errores en consola.

## Cómo trabajar

1. Antes de empezar y antes de subir, actualiza tu rama:
   ```bash
   git checkout TU_RAMA
   git pull origin main
   ```
2. Trabaja solo en tu carpeta de `lib/screens/`. Si necesitas cambiar algo de `models/`, `widgets/` o `core/`, avisa en el grupo primero.
3. Usa los colores de `core/theme.dart` y los widgets de `widgets/`; no crees colores nuevos.
4. Prueba en **Chrome y en Android** (`flutter run -d chrome` y `flutter run`) antes de subir.
5. Sube a tu rama y abre un **Pull Request hacia `main`** con `Closes #N` en la descripción:
   ```bash
   git add .
   git commit -m "Describe tu cambio"
   git push origin TU_RAMA
   ```

**Revisión automática:** cada vez que alguien sube a GitHub, la pestaña **Actions** compila la app y corre las pruebas. Si sale una ✗ roja en tu PR, abre el detalle para ver el error y corrígelo antes de pedir la aprobación.

**Reglas:**
- Nadie sube directo a `main`: todo pasa por Pull Request y lo aprueba el líder.
- No subas la carpeta `build/` ni archivos con contraseñas.
- Las tareas se siguen en Jira y en los Issues de GitHub.

## Comandos útiles

| Comando | Qué hace |
| --- | --- |
| `flutter pub get` | Instala las dependencias |
| `flutter run -d chrome` | Abre la app en el navegador |
| `flutter run` | Abre la app en Android |
| `flutter analyze` | Revisa errores en el código |
| `flutter test` | Corre las pruebas |
| `flutter build apk` | Genera el instalador de Android |
| `flutter build web` | Genera la versión web |
