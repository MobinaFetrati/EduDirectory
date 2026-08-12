import '../../../shared/models/employee_model.dart';

class SearchService {
  static List<EmployeeModel> search(
    List<EmployeeModel> employees,

    String query,
  ) {
    if (query.trim().isEmpty) {
      return employees;
    }

    final text = query.toLowerCase();

    return employees.where((employee) {
      return employee.firstName.toLowerCase().contains(text) ||
          employee.lastName.toLowerCase().contains(text) ||
          (employee.mobile ?? "").contains(text) ||
          (employee.phone ?? "").contains(text) ||
          (employee.unitName ?? "").toLowerCase().contains(text) ||
          (employee.jobTitle ?? "").toLowerCase().contains(text);
    }).toList();
  }
}
