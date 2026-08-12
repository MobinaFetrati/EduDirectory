import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/employee_model.dart';
import '../../features/admin/services/admin_employee_service.dart';

final employeesProvider = FutureProvider<List<EmployeeModel>>((ref) async {
  return AdminEmployeeService.getEmployees();
});
