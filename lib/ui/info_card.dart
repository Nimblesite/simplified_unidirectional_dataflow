import 'package:flutter/material.dart';
import 'package:simplified_unidirectional_dataflow/ui/constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: Spacing.md,
          ),
          child: Column(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              const SizedBox(height: Spacing.xs),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      );
}
