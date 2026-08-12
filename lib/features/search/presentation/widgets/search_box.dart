import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/search_provider.dart';

class SearchBox extends ConsumerWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12),

      child: TextField(
        decoration: const InputDecoration(
          hintText: "جستجو نام، مدرسه، شماره تلفن...",

          prefixIcon: Icon(Icons.search),

          border: OutlineInputBorder(),
        ),

        onChanged: (value) {
          ref.read(searchQueryProvider.notifier).state = value;
        },
      ),
    );
  }
}
