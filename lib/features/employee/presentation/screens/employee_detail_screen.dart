import 'package:edudirectory3/shared/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeDetailScreen({super.key, required this.employee});

  Future<void> _call(String? number) async {
    if (number == null || number.isEmpty) return;

    final uri = Uri.parse("tel:$number");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _map(double? lat, double? lng) async {
    if (lat == null || lng == null) return;

    final uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget item(String title, String? value) {
    return ListTile(title: Text(title), subtitle: Text(value ?? "-"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${employee.firstName} ${employee.lastName}")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _call(employee.mobile),
        child: const Icon(Icons.phone),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 55,
              backgroundImage: employee.photoUrl != null
                  ? NetworkImage(employee.photoUrl!)
                  : null,
              child: employee.photoUrl == null
                  ? const Icon(Icons.person, size: 45)
                  : null,
            ),
          ),
          const SizedBox(height: 20),

          item("نام", employee.firstName),
          item("نام خانوادگی", employee.lastName),
          item("گروه", employee.group),
          item("عنوان پست", employee.jobTitle),
          item("نام واحد", employee.unitName),
          item("شماره داخلی", employee.internalNumber),
          item("کد مکاتباتی", employee.correspondenceCode),
          item("تلفن", employee.phone),
          item("همراه", employee.mobile),
          item("موقعیت", employee.locationName),
          item("آدرس", employee.address),
          item("مقطع تحصیلی", employee.educationLevel),
          item("نام سرایدار", employee.janitorName),
          item("همراه سرایدار", employee.janitorMobile),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: () => _map(employee.latitude, employee.longitude),
            icon: const Icon(Icons.location_on),
            label: const Text("نمایش در Google Maps"),
          ),
        ],
      ),
    );
  }
}
