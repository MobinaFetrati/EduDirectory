import 'package:flutter/material.dart';

import '../../data/category_tree.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
    required this.onSelected,
  });

  final CategoryTree category;
  final ValueChanged<CategoryTree> onSelected;

  @override
  Widget build(BuildContext context) {
    if (category.children.isEmpty) {
      return ListTile(
        title: Text(category.title),
        leading: const Icon(Icons.folder),
        onTap: () {
          onSelected(category);
        },
      );
    }

    return ExpansionTile(
      title: Text(
        category.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),

      leading: const Icon(Icons.folder_open),

      children: category.children
          .map((child) => CategoryTile(category: child, onSelected: onSelected))
          .toList(),
    );
  }
}
