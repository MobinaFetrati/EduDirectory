import 'package:edudirectory3/app/colors.dart';
import 'package:edudirectory3/features/home/presentation/providers/filtered_employee_provider.dart';
import 'package:edudirectory3/shared/providers/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../groups/presentation/screens/groups_screen.dart';
import '../../../statistics/presentation/screens/statistics_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../../../auth/presentation/screens/admin_login_screen.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Drawer(
        backgroundColor: AppColors.background,

        child: Column(
          children: [
            // هدر
            Container(
              height: 180,

              width: double.infinity,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],

                  begin: Alignment.topRight,

                  end: Alignment.bottomLeft,
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),

                  bottomRight: Radius.circular(35),
                ),
              ),

              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),

                        shape: BoxShape.circle,
                      ),

                      child: Image.asset(
                        "assets/images/logo.png",

                        width: 70,

                        height: 70,

                        fit: BoxFit.contain,

                        errorBuilder: (_, __, ___) {
                          return const Icon(
                            Icons.school,

                            size: 60,

                            color: Colors.white,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "EduDirectory",

                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 22,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "سامانه اطلاعات کارکنان",

                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                children: [
                  _drawerAction(
                    context,
                    ref,
                    icon: Icons.refresh,
                    title: "بروزرسانی اطلاعات",
                    color: Colors.green,
                  ),
                  _drawerItem(
                    context,

                    icon: Icons.groups,

                    title: "گروه‌ها",

                    color: AppColors.primary,

                    page: const GroupsScreen(),
                  ),

                  _drawerItem(
                    context,

                    icon: Icons.bar_chart,

                    title: "آمار",

                    color: AppColors.secondary,

                    page: const StatisticsScreen(),
                  ),

                  _drawerItem(
                    context,

                    icon: Icons.settings,

                    title: "تنظیمات",

                    color: Colors.blueGrey,

                    page: const SettingsScreen(),
                  ),

                  const Divider(height: 35),

                  _drawerItem(
                    context,

                    icon: Icons.admin_panel_settings,

                    title: "ورود مدیر",

                    color: AppColors.primary,

                    page: const AdminLoginScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {

    required IconData icon,

    required String title,

    required Color color,

    required Widget page,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

        leading: Container(
          padding: const EdgeInsets.all(9),

          decoration: BoxDecoration(
            color: color.withOpacity(0.12),

            shape: BoxShape.circle,
          ),

          child: Icon(icon, color: color),
        ),

        title: Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.bold,

            color: AppColors.textPrimary,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.textSecondary,
        ),

        onTap: () {
          Navigator.pop(context);

          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }

  Widget _drawerAction(
    BuildContext context,
    WidgetRef ref, {
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        leading: Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: color.withOpacity(.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.textSecondary,
        ),
        onTap: () async {
          Navigator.pop(context);

          ref.invalidate(employeesProvider);
          ref.invalidate(filteredEmployeesProvider);

          await ref.read(filteredEmployeesProvider.future);

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("اطلاعات بروزرسانی شد")),
            );
          }
        },
      ),
    );
  }
}
