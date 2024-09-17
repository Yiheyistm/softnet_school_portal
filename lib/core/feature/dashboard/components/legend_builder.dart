import 'package:flutter/material.dart';

class BuildLegendItem extends StatelessWidget {
  const BuildLegendItem({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            // shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class LegendItem {
  final String title;
  final Color color;

  LegendItem({required this.title, required this.color});
}
