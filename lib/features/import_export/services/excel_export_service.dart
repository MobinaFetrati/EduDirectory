import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExcelExportService {
  ExcelExportService._();

  static final _db = Supabase.instance.client;

  static Future<void> exportExcel() async {
    final excel = Excel.createExcel();

    excel.delete('Sheet1');

    final employees = await _db.from('employees').select();

    print("EXPORT COUNT: ${employees.length}");

    final sheets = <String, List<Map<String, dynamic>>>{};

    for (final e in employees) {
      final name = _sheetName(e);

      sheets.putIfAbsent(name, () => []);

      sheets[name]!.add(Map<String, dynamic>.from(e));
    }

    for (final entry in sheets.entries) {
      final sheet = excel[entry.key];

      sheet.appendRow([
        TextCellValue("نام"),
        TextCellValue("نام خانوادگی"),
        TextCellValue("سمت"),
        TextCellValue("واحد"),
        TextCellValue("شماره داخلی"),
        TextCellValue("کد مکاتبات"),
        TextCellValue("تلفن"),
        TextCellValue("موبایل"),
        TextCellValue("محل"),
        TextCellValue("آدرس"),
        TextCellValue("تحصیلات"),
        TextCellValue("نام خدمتگزار"),
        TextCellValue("موبایل خدمتگزار"),
        TextCellValue("توضیحات"),
      ]);

      for (final e in entry.value) {
        sheet.appendRow([
          TextCellValue(e["first_name"] ?? ""),
          TextCellValue(e["last_name"] ?? ""),
          TextCellValue(e["job_title"] ?? ""),
          TextCellValue(e["unit_name"] ?? ""),
          TextCellValue(e["internal_number"] ?? ""),
          TextCellValue(e["correspondence_code"] ?? ""),
          TextCellValue(e["phone"] ?? ""),
          TextCellValue(e["mobile"] ?? ""),
          TextCellValue(e["location_name"] ?? ""),
          TextCellValue(e["address"] ?? ""),
          TextCellValue(e["education_level"] ?? ""),
          TextCellValue(e["janitor_name"] ?? ""),
          TextCellValue(e["janitor_mobile"] ?? ""),
          TextCellValue(e["description"] ?? ""),
        ]);
      }
    }

    final bytes = Uint8List.fromList(excel.encode()!);

    await FilePicker.platform.saveFile(
      dialogTitle: "ذخیره فایل اکسل",
      fileName: "EduDirectory.xlsx",
      bytes: bytes,
    );
  }

  static String _sheetName(Map<String, dynamic> e) {
    final group = e["group"] ?? "";

    final l1 = e["level1"] ?? "";

    final l2 = e["level2"] ?? "";

    final l3 = e["level3"] ?? "";

    if (group == "اداری") {
      if (l1 == "ریاست") {
        return "ریاست";
      }

      if (l1 == "معاونت‌ها") {
        return "معاونت $l2";
      }

      return "اداری";
    }

    if (group == "مدارس") {
      return "مدارس $l1 $l3 $l2";
    }

    if (group == "آموزشگاه‌های زبان و علمی") {
      return "آموزشگاههای علمی و زبان";
    }

    return "مراکز رفاهی";
  }
}
