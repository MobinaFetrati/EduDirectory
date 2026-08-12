import 'package:edudirectory3/app/colors.dart';
import 'package:edudirectory3/features/auth/services/admin_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'employee_list_screen.dart';
import 'add_employee_screen.dart';
import '../../../import_export/presentation/screens/import_screen.dart';
import '../../../import_export/presentation/screens/export_screen.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              _buildHeader(),

              const SizedBox(height: 10),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,

                  crossAxisSpacing: 16,

                  mainAxisSpacing: 16,

                  children: [
                    _AdminCard(
                      title: "افزودن کارمند",

                      icon: Icons.person_add_alt_1,

                      color: AppColors.primary,

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const AddEmployeeScreen(),
                          ),
                        );
                      },
                    ),

                    _AdminCard(
                      title: "وارد کردن اطلاعات",

                      icon: Icons.upload_file,

                      color: AppColors.secondary,

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const ImportScreen(),
                          ),
                        );
                      },
                    ),

                    _AdminCard(
                      title: "خروجی گرفتن",

                      icon: Icons.download,

                      color: AppColors.success,

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const ExportScreen(),
                          ),
                        );
                      },
                    ),

                    _AdminCard(
                      title: "مدیریت کارکنان",

                      icon: Icons.groups,

                      color: AppColors.warning,

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const EmployeeListScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _logoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),

      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
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
              // عنوان وسط
              const Center(
                child: Text(
                  "پنل مدیریت سازمان",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // لوگو سمت راست
              Positioned(
                right: 20,

                child: Image.asset(
                  "assets/images/logo.png",

                  width: 50,

                  height: 50,

                  fit: BoxFit.contain,

                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.account_balance,

                      color: Colors.white,

                      size: 40,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.secondary, AppColors.primary],
        ),

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),

            blurRadius: 12,

            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(
            "سامانه مدیریت کارکنان",

            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.white,

              fontSize: 19,

              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8),

          Text(
            "سازمان آموزش و پرورش منطقه ۵",

            textAlign: TextAlign.center,

            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      height: 45,

      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,

          foregroundColor: Colors.white,

          elevation: 3,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        icon: const Icon(Icons.logout),

        label: const Text(
          "خروج از حساب کاربری",

          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        onPressed: () {
          showDialog(
            context: context,

            barrierDismissible: false,

            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(24),
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.12),

                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.logout,

                          size: 40,

                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "خروج از حساب کاربری",

                        style: TextStyle(
                          fontSize: 20,

                          fontWeight: FontWeight.bold,

                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        "آیا مطمئن هستید که می‌خواهید خارج شوید؟",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 15,

                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.textSecondary,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),

                              onPressed: () {
                                Navigator.pop(context);
                              },

                              child: const Text("انصراف"),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.error,

                                foregroundColor: Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),

                              onPressed: () async {
                                await AdminAuthService.logout();

                                if (context.mounted) {
                                  Navigator.of(context).pop();

                                  context.go('/');
                                }
                              },

                              child: const Text("خروج"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _AdminCard extends StatelessWidget {
  final String title;

  final IconData icon;

  final Color color;

  final VoidCallback onTap;

  const _AdminCard({
    required this.title,

    required this.icon,

    required this.color,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),

      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(22),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),

              blurRadius: 12,

              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: color.withOpacity(0.12),

                shape: BoxShape.circle,
              ),

              child: Icon(icon, size: 38, color: color),
            ),

            const SizedBox(height: 15),

            Text(
              title,

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontWeight: FontWeight.bold,

                fontSize: 15,

                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
