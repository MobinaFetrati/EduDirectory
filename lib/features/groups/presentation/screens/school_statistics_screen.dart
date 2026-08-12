import 'package:flutter/material.dart';

class SchoolStatisticsScreen extends StatelessWidget {
  const SchoolStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("آمار نهایی مدارس")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          buildCard("ابتدایی دولتی پسرانه"),

          buildCard("ابتدایی دولتی دخترانه"),

          buildCard("ابتدایی غیر دولتی پسرانه"),

          buildCard("ابتدایی غیر دولتی دخترانه"),

          buildCard("متوسطه دوره اول"),

          buildCard("متوسطه دوره دوم نظری"),

          buildCard("متوسطه دوره دوم فنی و کاردانش"),
        ],
      ),
    );
  }

  Widget buildCard(String title) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.school),

        title: Text(title),

        trailing: const Text("0", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
