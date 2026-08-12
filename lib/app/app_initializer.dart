import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/constants/supabase_constants.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseConstants.url,
      publishableKey: SupabaseConstants.publishableKey,
    );
  }
}
