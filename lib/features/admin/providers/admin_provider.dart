import 'package:edudirectory3/features/admin/services/admin_employee_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/models/employee_model.dart';

final adminEmployeesProvider = FutureProvider<List<EmployeeModel>>((ref) async {
  return await AdminEmployeeService.getEmployees();
});
