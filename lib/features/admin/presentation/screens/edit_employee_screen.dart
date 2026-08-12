import 'package:flutter/material.dart';

import '../../../../shared/models/employee_model.dart';
import '../../services/admin_employee_service.dart';

class EditEmployeeScreen extends StatefulWidget {
  final EmployeeModel employee;

  const EditEmployeeScreen({super.key, required this.employee});

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController group;
  late TextEditingController jobTitle;
  late TextEditingController unitName;
  late TextEditingController phone;
  late TextEditingController mobile;

  @override
  void initState() {
    super.initState();

    firstName = TextEditingController(text: widget.employee.firstName);

    lastName = TextEditingController(text: widget.employee.lastName);

    group = TextEditingController(text: widget.employee.group);

    jobTitle = TextEditingController(text: widget.employee.jobTitle ?? "");

    unitName = TextEditingController(text: widget.employee.unitName ?? "");

    phone = TextEditingController(text: widget.employee.phone ?? "");

    mobile = TextEditingController(text: widget.employee.mobile ?? "");
  }

  Future<void> save() async {
    final employee = widget.employee.copyWith(
      firstName: firstName.text,

      lastName: lastName.text,

      group: group.text,

      jobTitle: jobTitle.text,

      unitName: unitName.text,

      phone: phone.text,

      mobile: mobile.text,
    );

    await AdminEmployeeService.updateEmployee(employee);

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ویرایش کارمند")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          TextField(
            controller: firstName,
            decoration: const InputDecoration(labelText: "نام"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: lastName,
            decoration: const InputDecoration(labelText: "نام خانوادگی"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: group,
            decoration: const InputDecoration(labelText: "گروه"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: jobTitle,
            decoration: const InputDecoration(labelText: "پست"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: unitName,
            decoration: const InputDecoration(labelText: "واحد"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: phone,
            decoration: const InputDecoration(labelText: "تلفن"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: mobile,
            decoration: const InputDecoration(labelText: "همراه"),
          ),

          const SizedBox(height: 24),

          FilledButton(onPressed: save, child: const Text("ذخیره")),
        ],
      ),
    );
  }
}
