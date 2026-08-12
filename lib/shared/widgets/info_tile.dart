import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final IconData icon;

  final String title;

  final String? value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),

      title: Text(title),

      subtitle: Text(value?.isEmpty ?? true ? "-" : value!),
    );
  }
}
