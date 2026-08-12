import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/services/supabase_service.dart';
import '../models/category_model.dart';

class CategoryRepository {
  final SupabaseClient _client = SupabaseService.client;

  Future<List<CategoryModel>> getAllCategories() async {
    final response = await _client
        .from('categories')
        .select()
        .order('sort_order');

    return response
        .map<CategoryModel>((json) => CategoryModel.fromJson(json))
        .toList();
  }

  Future<void> insertCategory(CategoryModel category) async {
    await _client.from('categories').insert(category.toJson());
  }

  Future<void> updateCategory(CategoryModel category) async {
    await _client
        .from('categories')
        .update(category.toJson())
        .eq('id', category.id!);
  }

  Future<void> deleteCategory(int id) async {
    await _client.from('categories').delete().eq('id', id);
  }
}
