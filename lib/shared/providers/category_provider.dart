import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/category_repository.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

final categoriesProvider = FutureProvider((ref) async {
  return ref.read(categoryRepositoryProvider).getAllCategories();
});
