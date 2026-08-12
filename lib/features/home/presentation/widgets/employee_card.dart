import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';

import '../../../../shared/models/employee_model.dart';
import '../../../../shared/widgets/app_avatar.dart';
import 'employee_detail_sheet.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel employee;
  final VoidCallback? onTap;

  const EmployeeCard({super.key, required this.employee, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),

              blurRadius: 14,

              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Material(
          color: Colors.transparent,

          child: InkWell(
            borderRadius: BorderRadius.circular(24),

            onTap:
                onTap ??
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return EmployeeDetailScreen(employee: employee);
                      },
                    ),
                  );
                },

            child: Padding(
              padding: const EdgeInsets.all(14),

              child: Row(
                children: [
                  // عکس کارمند سمت راست
                  Container(
                    padding: const EdgeInsets.all(3),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                      ),
                    ),

                    child: AppAvatar(imageUrl: employee.photoUrl, radius: 32),
                  ),

                  const SizedBox(width: 14),

                  // اطلاعات
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "${employee.firstName} ${employee.lastName}",

                          style: const TextStyle(
                            fontSize: 17,

                            fontWeight: FontWeight.bold,

                            color: AppColors.textPrimary,
                          ),
                        ),

                        const SizedBox(height: 8),

                        if (employee.jobTitle != null)
                          _infoRow(Icons.work_outline, employee.jobTitle!),

                        if (employee.unitName != null)
                          _infoRow(
                            Icons.apartment_outlined,

                            employee.unitName!,
                          ),

                        if (employee.mobile != null)
                          _infoRow(Icons.phone_android, employee.mobile!),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  Container(
                    padding: const EdgeInsets.all(8),

                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.10),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.arrow_forward_ios,

                      size: 16,

                      color: AppColors.primary,
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

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),

      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.secondary),

          const SizedBox(width: 6),

          Expanded(
            child: Text(
              text,

              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 13.5,

                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
