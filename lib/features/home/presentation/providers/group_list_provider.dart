import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupsProvider = Provider<List<String>>((ref) {
  return const [
    "اداری",
    "مدارس",
    "آموزشگاه‌های زبان و علمی",
    "مراکز رفاهی و خدماتی",
  ];
});
