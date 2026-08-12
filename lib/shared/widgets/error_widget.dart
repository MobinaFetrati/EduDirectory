import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final Object error;

  const AppErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          error.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      ),
    );
  }
}
