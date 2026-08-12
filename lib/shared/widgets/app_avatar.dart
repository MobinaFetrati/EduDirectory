import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;

  final double radius;

  const AppAvatar({super.key, this.imageUrl, this.radius = 30});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,

      backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
          ? NetworkImage(imageUrl!)
          : null,

      child: imageUrl == null || imageUrl!.isEmpty
          ? Icon(Icons.person, size: radius)
          : null,
    );
  }
}
