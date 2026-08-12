import 'package:flutter/material.dart';

class EmployeeAvatar extends StatelessWidget {
  const EmployeeAvatar({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 60,
        backgroundImage: image != null && image!.isNotEmpty
            ? NetworkImage(image!)
            : null,
        child: image == null || image!.isEmpty
            ? const Icon(Icons.person, size: 60)
            : null,
      ),
    );
  }
}
