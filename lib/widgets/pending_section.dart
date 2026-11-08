import 'package:flutter/material.dart';

import '../core/theme.dart';

/// Aviso temporal de una pantalla que todavía no está hecha.
/// Cada compañero lo borra cuando construye su pantalla.
class PendingSection extends StatelessWidget {
  const PendingSection({
    super.key,
    required this.owner,
    required this.issue,
    required this.todo,
  });

  /// Quién hace esta pantalla.
  final String owner;

  /// Número de la tarea en GitHub (ej: '#2').
  final String issue;

  /// Lo que debe tener la pantalla.
  final List<String> todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.soft,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x4DE8590C)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.construction, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Pantalla pendiente · $owner ($issue)',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          for (final item in todo)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('• $item', style: const TextStyle(color: AppColors.muted)),
            ),
        ],
      ),
    );
  }
}
