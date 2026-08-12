import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/group_structure.dart';

final groupStructureProvider = Provider<Map<String, dynamic>>((ref) {
  return GroupStructure.structure;
});
