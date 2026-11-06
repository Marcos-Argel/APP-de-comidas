# APP de Comidas — Domicilios

App de domicilios de varios restaurantes para **Android y web**, hecha con **Flutter**.
El usuario ve los restaurantes, entra al menú de cada uno, arma su carrito y hace el pedido.

## Funciones de la app

- **Inicio:** lista de restaurantes con foto, categoría, calificación y tiempo de entrega; buscador y filtro por categoría.
- **Restaurante:** información del local y su menú de platos con precio.
- **Carrito:** agregar y quitar platos, cambiar cantidades y ver el total.
- **Pedido:** formulario con nombre, dirección y teléfono; el pedido se envía por WhatsApp al restaurante.
- **Perfil:** mis pedidos y restaurantes favoritos.

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
│   │   └── favorites_provider.dart
│   ├── widgets/                 # Piezas que usa todo el equipo
│   │   ├── restaurant_card.dart
│   │   ├── dish_tile.dart
│   │   ├── app_button.dart
│   │   └── price_text.dart
│   └── screens/                 # Una carpeta por pantalla
│       ├── home/                # Santiago
│       ├── restaurant/          # Juan Parra
│       ├── cart/                # Juan Padilla
│       ├── checkout/            # Juan Padilla
│       └── profile/             # Marcos (pedidos y favoritos)
├── test/
├── pubspec.yaml                 # Dependencias
└── README.md
```

## Equipo, ramas y tareas

| Integrante | Rama | Tarea | Fecha |
| --- | --- | --- | --- |
| Luis Vergara | `luis` | Proyecto base: `flutter create`, tema, rutas, modelos, datos de ejemplo y widgets compartidos (#1) | 13 nov |
| Santiago Cogollo | `santiago` | Pantalla de Inicio: lista de restaurantes, buscador y filtro (#2) | 20 nov |
| Juan Pablo Parra | `juan-parra` | Pantalla de Restaurante y menú de platos (#3) | 20 nov |
| Juan Pablo Padilla | `juan-padilla` | Carrito y pedido por WhatsApp (#4) | 24 nov |
| Marcos Argel | `marcos` | Perfil: mis pedidos y favoritos (#5) — líder | 24 nov |
| Marcos Argel | `marcos` | Revisión final, APK de Android y web publicada (#6) | 1 dic |

**Orden de trabajo:** Luis va primero, porque las demás pantallas usan sus modelos, datos y widgets. Mientras tanto, cada uno puede ir diseñando su pantalla.

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
| `flutter build apk` | Genera el instalador de Android |
| `flutter build web` | Genera la versión web |
