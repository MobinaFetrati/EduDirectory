import 'package:edudirectory3/app/colors.dart';
import 'package:edudirectory3/features/admin/services/admin_employee_service.dart';
import 'package:edudirectory3/features/import_export/services/backup_service.dart';
import 'package:edudirectory3/features/import_export/services/excel_export_service.dart';
import 'package:flutter/material.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({super.key});

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  bool loading = false;

  Future<void> exportJson() async {
    setState(() {
      loading = true;
    });

    final employees = await AdminEmployeeService.getEmployees();

    await BackupService.createBackup(employees);

    if (mounted) {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("فایل JSON ذخیره شد")));
    }
  }

  Future<void> exportExcel() async {
    setState(() {
      loading = true;
    });

    await ExcelExportService.exportExcel();

    if (mounted) {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("فایل Excel ذخیره شد")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: _buildAppBar(),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Container(
              width: double.infinity,

              padding: const EdgeInsets.all(30),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(26),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),

                    blurRadius: 20,

                    offset: const Offset(0, 8),
                  ),
                ],
              ),

              child: loading
                  ? const SizedBox(
                      height: 120,

                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),

                          decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.12),

                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.download_rounded,

                            size: 55,

                            color: AppColors.secondary,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "خروجی اطلاعات کارکنان",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 20,

                            fontWeight: FontWeight.bold,

                            color: AppColors.textPrimary,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "دریافت نسخه پشتیبان در قالب Excel یا JSON",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 14,

                            color: AppColors.textSecondary,
                          ),
                        ),

                        const SizedBox(height: 30),

                        _exportButton(
                          title: "خروجی Excel",

                          icon: Icons.table_view,

                          color: AppColors.success,

                          onTap: exportExcel,
                        ),

                        const SizedBox(height: 15),

                        _exportButton(
                          title: "خروجی JSON",

                          icon: Icons.code,

                          color: AppColors.primary,

                          onTap: exportJson,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _exportButton({
    required String title,

    required IconData icon,

    required Color color,

    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,

      height: 55,

      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,

          foregroundColor: Colors.white,

          elevation: 3,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        icon: Icon(icon),

        label: Text(
          title,

          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        onPressed: onTap,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),

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
              const Center(
                child: Text(
                  "خروجی اطلاعات",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 20,

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
                    color: Colors.white.withOpacity(0.15),

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
                left: 20,

                child: InkWell(
                  borderRadius: BorderRadius.circular(50),

                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),

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
