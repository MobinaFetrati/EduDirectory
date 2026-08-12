import 'package:flutter/material.dart';

class GroupDetailScreen extends StatelessWidget {
  final String title;

  const GroupDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: Center(
        child: Text(
          "اطلاعات گروه $title",

          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
