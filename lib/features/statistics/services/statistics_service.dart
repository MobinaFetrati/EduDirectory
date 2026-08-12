import 'package:supabase_flutter/supabase_flutter.dart';

class StatisticsService {
  static final _db = Supabase.instance.client;

  static Future<Map<String, int>> getStatistics() async {
    final data = await _db.from('employees').select('group');

    final Map<String, int> result = {};

    for (final item in data) {
      final group = item['group'] as String? ?? 'بدون گروه';

      result[group] = (result[group] ?? 0) + 1;
    }

    return result;
  }
}
