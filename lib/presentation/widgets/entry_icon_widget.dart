import 'package:flutter/material.dart';

class EntryIconWidget extends StatelessWidget {
  final IconData icon;
  final double size;

  const EntryIconWidget({
    super.key,
    required this.icon,
    this.size = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 2.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Icon(icon, size: size));
  }
}
