import 'package:excel/excel.dart';

class ExcelTemplateService {
  static final List<String> sheets = [
    "ریاست",

    "معاونت پشتیبانی",

    "معاونت آموزش متوسطه",

    "معاونت آموزش ابتدایی",

    "معاونت پرورشی",

    "مدارس ابتدایی پسرانه دولتی",

    "مدارس ابتدایی دخترانه دولتی",

    "مدارس ابتدایی پسرانه غیر دولتی",

    "مدارس ابتدایی دخترانه غیر دولتی",

    "مدارس متوسطه ۱ پسرانه دولتی",

    "مدارس متوسطه ۱ دخترانه دولتی",

    "مدارس متوسطه ۱ پسرانه غیردولتی",

    "مدارس متوسطه ۱ دخترانه غیردولتی",

    "مدارس متوسطه ۲ پسرانه دولتی",

    "مدارس متوسطه ۲ دخترانه دولتی",

    "مدارس متوسطه ۲ پسرانه غیردولتی",

    "مدارس متوسطه ۲ دخترانه غیردولتی",

    "آموزشگاههای علمی و زبان",
  ];

  static Excel createTemplate() {
    final excel = Excel.createExcel();

    excel.delete("Sheet1");

    for (final name in sheets) {
      final sheet = excel[name];

      sheet.appendRow([
        TextCellValue("نام"),

        TextCellValue("نام خانوادگی"),

        TextCellValue("عنوان پست"),

        TextCellValue("نام واحد"),

        TextCellValue("شماره داخلی"),

        TextCellValue("کد مکاتباتی"),

        TextCellValue("شماره تلفن"),

        TextCellValue("شماره همراه"),

        TextCellValue("آدرس"),

        TextCellValue("مقطع تحصیلی"),

        TextCellValue("نام سرایدار"),

        TextCellValue("شماره همراه سرایدار"),
      ]);
    }

    return excel;
  }
}
