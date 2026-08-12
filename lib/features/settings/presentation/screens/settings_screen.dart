import 'package:edudirectory3/app/colors.dart';
import 'package:edudirectory3/app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: _buildAppBar(context),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: ListView(
          padding: const EdgeInsets.all(18),

          children: [
            _settingCard(
              context,

              icon: Icons.dark_mode,

              title: "حالت تاریک",

              subtitle: "تغییر ظاهر برنامه",

              trailing: Switch(
                value: isDark,

                onChanged: (value) {
                  ref.read(themeProvider.notifier).state = value
                      ? ThemeMode.dark
                      : ThemeMode.light;
                },
              ),
            ),

            _settingCard(
              context,

              icon: Icons.info_outline,

              title: "درباره برنامه",

              subtitle: "EduDirectory",
            ),

            _settingCard(
              context,

              icon: Icons.storage,

              title: "وضعیت پایگاه داده",

              subtitle: "اتصال Supabase فعال است",
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingCard(
    BuildContext context, {

    required IconData icon,

    required String title,

    required String subtitle,

    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.25 : 0.08,
            ),

            blurRadius: 14,

            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),

              shape: BoxShape.circle,
            ),

            child: Icon(icon, color: AppColors.primary, size: 28),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: TextStyle(
                    fontSize: 17,

                    fontWeight: FontWeight.bold,

                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  subtitle,

                  style: TextStyle(
                    fontSize: 14,

                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(.65),
                  ),
                ),
              ],
            ),
          ),

          if (trailing != null) trailing,
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),

      child: Container(
        height: 110,

        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],

            begin: Alignment.topRight,

            end: Alignment.bottomLeft,
          ),

          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35),

            bottomRight: Radius.circular(35),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),

              blurRadius: 15,

              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,

            children: [
              const Center(
                child: Text(
                  "تنظیمات",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 21,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Positioned(
                right: 18,

                child: Container(
                  width: 45,

                  height: 45,

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.15),

                    shape: BoxShape.circle,
                  ),

                  child: Image.asset(
                    "assets/images/logo.png",

                    fit: BoxFit.contain,

                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.school,

                        color: Colors.white,

                        size: 40,
                      );
                    },
                  ),
                ),
              ),

              Positioned(
                left: 18,

                child: InkWell(
                  borderRadius: BorderRadius.circular(50),

                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.18),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.arrow_back,

                      color: Colors.white,

                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
