import 'package:flutter/material.dart';

class EmployeeInfoCard extends StatelessWidget {
  const EmployeeInfoCard({super.key, required this.title, required this.value});

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.trim().isEmpty) {
      return const SizedBox();
    }

    return Card(
      child: ListTile(title: Text(title), subtitle: Text(value!)),
    );
  }
}
