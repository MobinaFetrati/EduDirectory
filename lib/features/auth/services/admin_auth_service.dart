import 'package:supabase_flutter/supabase_flutter.dart';

class AdminAuthService {
  AdminAuthService._();

  static final _client = Supabase.instance.client;

  static Future<bool> login(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return response.user != null;
    } catch (_) {
      return false;
    }
  }

  static Future<void> logout() async {
    await _client.auth.signOut();
  }
}
