import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/services/supabase_service.dart';
import '../models/employee_model.dart';

class EmployeeRepository {
  final SupabaseClient _client = SupabaseService.client;

  Future<List<EmployeeModel>> getAllEmployees() async {
    final response = await _client
        .from('employees')
        .select()
        .order('last_name');

    return response
        .map<EmployeeModel>((json) => EmployeeModel.fromJson(json))
        .toList();
  }

  Future<EmployeeModel?> getEmployeeById(int id) async {
    final response = await _client
        .from('employees')
        .select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;

    return EmployeeModel.fromJson(response);
  }

  Future<void> insertEmployee(EmployeeModel employee) async {
    await _client.from('employees').insert(employee.toJson());
  }

  Future<void> updateEmployee(EmployeeModel employee) async {
    await _client
        .from('employees')
        .update(employee.toJson())
        .eq('id', employee.id!);
  }

  Future<void> deleteEmployee(int id) async {
    await _client.from('employees').delete().eq('id', id);
  }
}
