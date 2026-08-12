import 'package:flutter/material.dart';

import '../../../../shared/models/employee_model.dart';

class AdminEmployeeTile extends StatelessWidget {
  const AdminEmployeeTile({
    super.key,

    required this.employee,

    required this.onEdit,

    required this.onDelete,
  });

  final EmployeeModel employee;

  final VoidCallback onEdit;

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: employee.photoUrl != null
              ? NetworkImage(employee.photoUrl!)
              : null,

          child: employee.photoUrl == null ? const Icon(Icons.person) : null,
        ),

        title: Text("${employee.firstName} ${employee.lastName}"),

        subtitle: Text(employee.jobTitle ?? ""),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),

            IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
