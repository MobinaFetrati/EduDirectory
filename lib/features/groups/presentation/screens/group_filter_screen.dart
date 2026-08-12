import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/group_structure.dart';
import '../providers/group_filter_provider.dart';

class GroupFilterScreen extends ConsumerWidget {
  const GroupFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("فیلتر گروه ها")),

      body: ListView(
        children: GroupStructure.structure.keys.map((group) {
          return ListTile(
            title: Text(group),

            onTap: () {
              ref.read(selectedGroupProvider.notifier).state = group;

              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }
}
