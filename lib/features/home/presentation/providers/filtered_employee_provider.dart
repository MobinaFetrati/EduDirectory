import 'package:edudirectory3/features/search/presentation/providers/search_provider.dart';
import 'package:edudirectory3/features/search/services/search_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/models/employee_model.dart';
import '../../../../shared/providers/employee_provider.dart';
import 'filter_provider.dart';

final filteredEmployeesProvider = FutureProvider<List<EmployeeModel>>((
  ref,
) async {
  final employees = await ref.watch(employeesProvider.future);

  final search = ref.watch(searchQueryProvider);

  final filters = ref.watch(selectedFilterProvider);

  var result = SearchService.search(employees, search);

  if (filters.isNotEmpty) {
    result = result.where((e) {
      final values = [e.group, e.level1, e.level2, e.level3, e.level4];

      for (final item in filters) {
        if (!values.contains(item)) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  return result;
});
