import 'package:flutter/material.dart';
import '../../services/statistics_service.dart';

class GroupStatisticsScreen extends StatefulWidget {
  const GroupStatisticsScreen({super.key});

  @override
  State<GroupStatisticsScreen> createState() => _GroupStatisticsScreenState();
}

class _GroupStatisticsScreenState extends State<GroupStatisticsScreen> {
  Map<String, int> statistics = {};

  bool loading = true;

  @override
  void initState() {
    super.initState();

    load();
  }

  Future<void> load() async {
    final result = await StatisticsService.getStatistics();

    setState(() {
      statistics = result;

      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("آمار گروه‌ها")),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),

              children: statistics.entries.map((e) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.school),

                    title: Text(e.key),

                    trailing: Text(
                      e.value.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
