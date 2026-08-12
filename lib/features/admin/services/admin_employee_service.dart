import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/models/employee_model.dart';

class AdminEmployeeService {
  static final _db = Supabase.instance.client;

  static Future<List<EmployeeModel>> getEmployees() async {
    final response = await _db.from('employees').select().order('created_at');

    return (response as List).map((e) => EmployeeModel.fromJson(e)).toList();
  }

  static Future<void> addEmployee(EmployeeModel employee) async {
    await _db.from('employees').insert(employee.toJson());
  }

  static Future<void> updateEmployee(EmployeeModel employee) async {
    if (employee.id == null) return;

    await _db
        .from('employees')
        .update(employee.toJson())
        .eq('id', employee.id!);
  }

  static Future<void> deleteEmployee(int id) async {
    await _db.from('employees').delete().eq('id', id);
  }
}
