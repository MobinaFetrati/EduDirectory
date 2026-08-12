import 'package:flutter/material.dart';

import '../../data/category_tree.dart';
import '../widgets/category_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('گروه‌ها')),

      body: ListView(
        children: educationCategoryTree
            .map(
              (category) =>
                  CategoryTile(category: category, onSelected: (value) {}),
            )
            .toList(),
      ),
    );
  }
}
