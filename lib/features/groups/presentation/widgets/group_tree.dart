import 'package:flutter/material.dart';

import '../screens/group_detail_screen.dart';

class GroupTree extends StatelessWidget {
  final Map<String, dynamic> data;

  const GroupTree({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.entries.map((entry) {
        return _buildNode(context, entry.key, entry.value);
      }).toList(),
    );
  }

  Widget _buildNode(BuildContext context, String title, dynamic children) {
    if (children is Map && children.isNotEmpty) {
      return ExpansionTile(
        title: Text(title),

        children: children.entries.map((item) {
          return _buildNode(context, item.key, item.value);
        }).toList(),
      );
    }

    return ListTile(
      title: Text(title),

      trailing: const Icon(Icons.arrow_forward_ios, size: 16),

      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(builder: (_) => GroupDetailScreen(title: title)),
        );
      },
    );
  }
}
