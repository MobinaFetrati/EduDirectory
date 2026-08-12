import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedFilterProvider = StateProvider<List<String>>((ref) {
  return [];
});
