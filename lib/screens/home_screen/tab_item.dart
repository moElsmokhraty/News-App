import 'package:flutter/material.dart';
import 'package:news_app/models/source.dart';

class TabItem extends StatelessWidget {
  const TabItem(this.source, this.isSelected, {super.key});

  final Source source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.green),
      ),
      child: Text(
        source.name!,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
