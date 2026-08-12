import 'package:edudirectory3/shared/providers/employee_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/search_service.dart';
import 'search_provider.dart';

final searchedEmployeesProvider = Provider((ref) {
  final employees = ref.watch(employeesProvider).value ?? [];

  final query = ref.watch(searchQueryProvider);

  return SearchService.search(employees, query);
});
