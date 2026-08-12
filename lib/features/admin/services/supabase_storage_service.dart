import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  SupabaseStorageService._();

  static final _client = Supabase.instance.client;

  static const bucket = 'employee-images';

  static Future<String> uploadImage({
    required Uint8List bytes,
    required String fileName,
  }) async {
    final path = '${DateTime.now().millisecondsSinceEpoch}_$fileName';

    await _client.storage
        .from(bucket)
        .uploadBinary(
          path,
          bytes,
          fileOptions: const FileOptions(upsert: true),
        );

    return _client.storage.from(bucket).getPublicUrl(path);
  }

  static Future<void> deleteImage(String imageUrl) async {
    try {
      final uri = Uri.parse(imageUrl);

      final path = uri.pathSegments.last;

      await _client.storage.from(bucket).remove([path]);
    } catch (_) {}
  }
}
