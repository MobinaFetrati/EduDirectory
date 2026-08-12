import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String title;

  const EmptyWidget({super.key, this.title = "اطلاعاتی یافت نشد"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.inbox, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
