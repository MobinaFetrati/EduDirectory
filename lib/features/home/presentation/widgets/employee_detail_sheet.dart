import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/models/employee_model.dart';
import '../../../../shared/widgets/app_avatar.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeDetailScreen({super.key, required this.employee});

  Future<void> _copyNumber(BuildContext context, String number) async {
    await Clipboard.setData(ClipboardData(text: number));

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("شماره کپی شد")));
  }

  Future<void> _call(String number) async {
    final uri = Uri.parse("tel:$number");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF5F4),

      appBar: _buildAppBar(context),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),

          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],

                    begin: Alignment.topRight,

                    end: Alignment.bottomLeft,
                  ),

                  borderRadius: BorderRadius.circular(25),
                ),

                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),

                        shape: BoxShape.circle,
                      ),

                      child: AppAvatar(imageUrl: employee.photoUrl, radius: 45),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      "${employee.firstName} ${employee.lastName}",

                      style: const TextStyle(
                        color: Colors.white,

                        fontSize: 22,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    if (employee.jobTitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),

                        child: Text(
                          employee.jobTitle!,

                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _infoCard(Icons.work_outline, "عنوان پست", employee.jobTitle),

              _infoCard(
                Icons.apartment_outlined,
                "نام واحد",
                employee.unitName,
              ),

              _phoneCard(context, Icons.phone, "شماره تلفن", employee.phone),

              _phoneCard(
                context,
                Icons.phone_android,
                "شماره همراه",
                employee.mobile,
              ),

              _infoCard(
                Icons.location_on_outlined,
                "موقعیت",
                employee.locationName,
              ),

              _infoCard(Icons.home_outlined, "آدرس", employee.address),

              _infoCard(
                Icons.school_outlined,
                "مقطع تحصیلی",
                employee.educationLevel,
              ),

              _infoCard(
                Icons.person_outline,
                "نام سرایدار",
                employee.janitorName,
              ),

              _phoneCard(
                context,
                Icons.phone,
                "همراه سرایدار",
                employee.janitorMobile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(IconData icon, String title, String? value) {
    if (value == null || value.isEmpty) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 10),
        ],
      ),

      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 12,

                    color: AppColors.textSecondary,
                  ),
                ),

                Text(
                  value,

                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneCard(
    BuildContext context,
    IconData icon,
    String title,
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Icon(icon, color: AppColors.success),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),

                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            icon: const Icon(Icons.copy, color: AppColors.primary),

            onPressed: () {
              _copyNumber(context, value);
            },
          ),

          IconButton(
            icon: const Icon(Icons.call, color: Colors.green),

            onPressed: () {
              _call(value);
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
                      Icons.school,

                      color: Colors.white,

                      size: 40,
                    );
                  },
                ),
              ),
              Positioned(
                left: 18,

                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.18),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(Icons.arrow_back, color: Colors.white),
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
