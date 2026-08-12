import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'app/app_initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.initialize();
  final result = await Supabase.instance.client
      .from('employees')
      .select()
      .limit(1);

  print(result);
  runApp(const ProviderScope(child: EduDirectoryApp()));
}
