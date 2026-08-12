import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/group_chip_provider.dart';
import '../providers/group_list_provider.dart';
import 'filter_chip_bar.dart';

class HomeFilterBar extends ConsumerWidget {
  const HomeFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(groupsProvider);

    final selected = ref.watch(groupChipProvider);

    return FilterChipBar(
      items: groups,

      selected: selected,

      onSelected: (value) {
        ref.read(groupChipProvider.notifier).state = value;
      },
    );
  }
}
