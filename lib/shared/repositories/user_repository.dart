import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/services/supabase_service.dart';
import '../models/user_model.dart';

class UserRepository {
  final SupabaseClient _client = SupabaseService.client;

  Future<UserModel?> getUser(String id) async {
    final response = await _client
        .from('users')
        .select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;

    return UserModel.fromJson(response);
  }

  Future<void> saveUser(UserModel user) async {
    await _client.from('users').upsert(user.toJson());
  }
}
