import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/statistics_service.dart';

final statisticsProvider = FutureProvider<Map<String, int>>((ref) async {
  return StatisticsService.getStatistics();
});
