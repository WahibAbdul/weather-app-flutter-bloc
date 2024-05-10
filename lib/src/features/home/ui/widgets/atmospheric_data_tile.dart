import 'package:falconi_weather/src/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class AtmosphericDataTile extends StatelessWidget {
  const AtmosphericDataTile({
    super.key,
    required this.title,
    required this.value,
    this.description,
  });
  final String title;
  final String value;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(50),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onPrimary.withAlpha(180),
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              )),
          Spacing.vMedium,
          Text(value,
              style: theme.textTheme.displayMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w500,
              )),
          if (description != null)
            Text(description!,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w500,
                )),
        ],
      ),
    );
  }
}
