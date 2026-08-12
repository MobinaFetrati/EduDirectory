import 'package:edudirectory3/app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';
import 'theme.dart';

class EduDirectoryApp extends ConsumerWidget {
  const EduDirectoryApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: "EduDirectory",

      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,

      themeMode: mode,

      routerConfig: router,
    );
  }
}
