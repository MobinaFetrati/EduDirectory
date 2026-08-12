import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExcelImportService {
  ExcelImportService._();

  static final _db = Supabase.instance.client;

  static Future<void> importExcel(Uint8List bytes) async {
    print("Bytes length: ${bytes.length}");
    print("========== IMPORT START ==========");

    final excel = Excel.decodeBytes(bytes);
    print(excel.tables.keys);
    print("Sheets: ${excel.tables.keys}");

    for (final sheetName in excel.tables.keys) {
      final sheet = excel.tables[sheetName];

      if (sheet == null) {
        print("Sheet is null : $sheetName");
        continue;
      }

      print("Processing sheet: $sheetName");
      print("Rows: ${sheet.rows.length}");

      if (sheet.rows.length <= 1) {
        continue;
      }

      for (int i = 1; i < sheet.rows.length; i++) {
        final row = sheet.rows[i];

        try {
          final data = {
            "first_name": _value(row, 0),
            "last_name": _value(row, 1),
            "job_title": _value(row, 2),
            "unit_name": _value(row, 3),
            "internal_number": _value(row, 4),
            "correspondence_code": _value(row, 5),
            "phone": _value(row, 6),
            "mobile": _value(row, 7),
            "location_name": _value(row, 8),
            "address": _value(row, 9),
            "education_level": _value(row, 10),
            "janitor_name": _value(row, 11),
            "janitor_mobile": _value(row, 12),
            "description": _value(row, 13),
            "photo_url": null,
            "latitude": null,
            "longitude": null,
            "category_id": null,
            "group": _group(sheetName),
            "level1": _level1(sheetName),
            "level2": _level2(sheetName),
            "level3": _level3(sheetName),
            "level4": _level4(sheetName),
            "is_active": true,
          };

          print(data);

          await _db.from("employees").insert(data);
        } catch (e, s) {
          print("==============================");
          print("ERROR IN ROW ${i + 1}");
          print(e);
          print(s);
          print("==============================");

          rethrow;
        }
      }
    }

    print("========== IMPORT FINISHED ==========");
  }

  static String? _value(List<Data?> row, int index) {
    if (index >= row.length) return null;

    final cell = row[index];

    if (cell == null) return null;

    final value = cell.value?.toString();

    if (value == null) return null;

    if (value.trim().isEmpty) return null;

    return value.trim();
  }

  static String _group(String sheet) {
    if (sheet.contains("مدارس")) {
      return "مدارس";
    }

    if (sheet.contains("آموزشگاه") || sheet.contains("زبان")) {
      return "آموزشگاه‌های زبان و علمی";
    }

    if (sheet.contains("رفاهی")) {
      return "مراکز رفاهی و خدماتی";
    }

    return "اداری";
  }

  static String? _level1(String sheet) {
    if (sheet.contains("ریاست")) return "ریاست";
    if (sheet.contains("آموزش ابتدایی")) return "آموزش ابتدایی";
    if (sheet.contains("آموزش متوسطه")) return "آموزش متوسطه";
    if (sheet.contains("تربیت بدنی")) return "تربیت بدنی و پرورشی";
    if (sheet.contains("توسعه")) return "توسعه مدیریت و پشتیبانی";
    if (sheet.contains("پژوهش")) return "پژوهش و آموزش نیروی انسانی";
    if (sheet.contains("ابتدایی")) return "ابتدایی";
    if (sheet.contains("متوسطه اول")) return "متوسطه اول";
    if (sheet.contains("متوسطه دوم")) return "متوسطه دوم";

    return null;
  }

  static String? _level2(String sheet) {
    if (sheet.contains("دولتی")) return "دولتی";
    if (sheet.contains("غیردولتی")) return "غیردولتی";

    return null;
  }

  static String? _level3(String sheet) {
    if (sheet.contains("پسرانه")) return "پسرانه";
    if (sheet.contains("دخترانه")) return "دخترانه";

    return null;
  }

  static String? _level4(String sheet) {
    return null;
  }
}
