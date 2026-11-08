import 'package:flutter/material.dart';

/// Botón principal de la app, de ancho completo.
///
/// ```dart
/// AppButton(label: 'Hacer pedido', icon: Icons.send, onPressed: () {})
/// AppButton(label: 'Seguir comprando', outlined: true, onPressed: () {})
/// ```
/// Si `onPressed` es null, el botón se ve deshabilitado.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.outlined = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final child = icon == null
        ? Text(label)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 8),
              Text(label),
            ],
          );

    return SizedBox(
      width: double.infinity,
      child: outlined
          ? OutlinedButton(onPressed: onPressed, child: child)
          : FilledButton(onPressed: onPressed, child: child),
    );
  }
}
