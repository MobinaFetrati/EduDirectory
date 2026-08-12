import 'dart:convert';

import 'package:file_saver/file_saver.dart';

import '../../../shared/models/employee_model.dart';

class BackupService {
  static Future<void> createBackup(List<EmployeeModel> employees) async {
    final json = jsonEncode(employees.map((e) => e.toJson()).toList());

    final bytes = utf8.encode(json);

    await FileSaver.instance.saveFile(
      name: "EduDirectory_Backup",

      bytes: bytes,

      ext: "json",
    );
  }
}
