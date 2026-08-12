import 'package:flutter/material.dart';

import '../../../../shared/models/employee_model.dart';
import '../../../../shared/widgets/empty_widget.dart';
import 'employee_card.dart';

class EmployeeList extends StatelessWidget {
  final List<EmployeeModel> employees;

  const EmployeeList({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    if (employees.isEmpty) {
      return const EmptyWidget();
    }

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 20),

      itemCount: employees.length,

      separatorBuilder: (_, __) => const SizedBox(height: 2),

      itemBuilder: (_, index) {
        return EmployeeCard(employee: employees[index]);
      },
    );
  }
}
