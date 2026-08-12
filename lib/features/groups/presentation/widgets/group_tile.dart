import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  final String title;

  final VoidCallback? onTap;

  const GroupTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),

      trailing: const Icon(Icons.chevron_left),

      onTap: onTap,
    );
  }
}
