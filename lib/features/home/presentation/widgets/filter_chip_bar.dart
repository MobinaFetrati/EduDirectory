import 'package:flutter/material.dart';

class FilterChipBar extends StatelessWidget {
  final List<String> items;
  final String? selected;
  final ValueChanged<String?> onSelected;

  const FilterChipBar({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) {
          final item = items[index];

          return ChoiceChip(
            label: Text(item),
            selected: selected == item,
            onSelected: (_) {
              if (selected == item) {
                onSelected(null);
              } else {
                onSelected(item);
              }
            },
          );
        },
      ),
    );
  }
}
