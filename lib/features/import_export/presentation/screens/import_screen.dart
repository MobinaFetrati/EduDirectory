import 'package:edudirectory3/app/colors.dart';
import 'package:edudirectory3/features/import_export/services/excel_import_service.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  bool loading = false;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,

      allowedExtensions: ["xlsx", "json"],

      withData: true,
    );

    if (result == null) {
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      await ExcelImportService.importExcel(result.files.first.bytes!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("اطلاعات با موفقیت وارد شد")),
        );
      }
    } catch (e, s) {
      debugPrint("========== IMPORT ERROR ==========");
      debugPrint(e.toString());
      debugPrint(s.toString());

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    if (mounted) {
      setState(() {
        loading = false;
      });
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

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.12),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.upload_file,

                      size: 55,

                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "وارد کردن اطلاعات کارکنان",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 20,

                      fontWeight: FontWeight.bold,

                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "فایل Excel یا JSON کارکنان را انتخاب کنید",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 14,

                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,

                    height: 55,

                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,

                        foregroundColor: Colors.white,

                        elevation: 4,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),

                      icon: loading
                          ? const SizedBox(
                              width: 22,

                              height: 22,

                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.folder_open),

                      label: Text(
                        loading
                            ? "در حال پردازش..."
                            : "انتخاب فایل Excel یا JSON",

                        style: const TextStyle(
                          fontSize: 16,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      onPressed: loading ? null : pickFile,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),

      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.secondary, AppColors.primary],
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
                  "وارد کردن اطلاعات",

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
