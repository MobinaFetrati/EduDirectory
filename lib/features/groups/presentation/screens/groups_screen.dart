import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/group_filter_provider.dart';

class GroupsScreen extends ConsumerWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGroup = ref.watch(selectedGroupProvider);

    return Scaffold(
      backgroundColor: const Color(0xffEEF5F4),

      appBar: _buildAppBar(context),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: ListView(
          padding: const EdgeInsets.all(18),

          children: [
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],

                  begin: Alignment.topRight,

                  end: Alignment.bottomLeft,
                ),

                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),

                    blurRadius: 15,

                    offset: const Offset(0, 6),
                  ),
                ],
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Icon(Icons.account_tree, color: Colors.white, size: 45),

                  SizedBox(height: 12),

                  Text(
                    "دسته‌بندی سازمانی",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "انتخاب گروه برای مشاهده اطلاعات",

                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            _groupCard(
              context,

              ref,

              title: "اداری",

              icon: Icons.business_center,

              selected: selectedGroup == "اداری",
            ),

            _groupCard(
              context,

              ref,

              title: "آموزشی",

              icon: Icons.school,

              selected: selectedGroup == "آموزشی",
            ),

            _groupCard(
              context,

              ref,

              title: "خدماتی",

              icon: Icons.support_agent,

              selected: selectedGroup == "خدماتی",
            ),
          ],
        ),
      ),
    );
  }

  Widget _groupCard(
    BuildContext context,

    WidgetRef ref, {

    required String title,

    required IconData icon,

    required bool selected,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),

      onTap: () {
        ref.read(selectedGroupProvider.notifier).state = title;
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withOpacity(0.12) : Colors.white,

          borderRadius: BorderRadius.circular(22),

          border: Border.all(
            color: selected ? AppColors.primary : Colors.transparent,

            width: 1.5,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),

              blurRadius: 12,

              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primary.withOpacity(0.15)
                    : AppColors.secondary.withOpacity(0.12),

                shape: BoxShape.circle,
              ),

              child: Icon(
                icon,

                color: selected ? AppColors.primary : AppColors.secondary,

                size: 28,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                title,

                style: TextStyle(
                  fontSize: 17,

                  fontWeight: FontWeight.bold,

                  color: selected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,

              size: 18,

              color: selected ? AppColors.primary : AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),

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
              // عنوان وسط
              const Center(
                child: Text(
                  "گروه‌ها",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // لوگو سمت راست
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

              // دکمه برگشت سمت چپ
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
