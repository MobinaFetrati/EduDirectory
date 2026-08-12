import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/statistics_provider.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(statisticsProvider);

    return Scaffold(
      backgroundColor: const Color(0xffEEF5F4),

      appBar: _buildAppBar(context),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: statistics.when(
          data: (data) {
            if (data.isEmpty) {
              return const Center(
                child: Text(
                  "آماری موجود نیست",

                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(18),

              itemCount: data.length,

              itemBuilder: (_, index) {
                final item = data.entries.elementAt(index);

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),

                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(22),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),

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

                        child: const Icon(
                          Icons.groups,

                          color: AppColors.primary,

                          size: 30,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Text(
                          item.key,

                          style: const TextStyle(
                            fontSize: 17,

                            fontWeight: FontWeight.bold,

                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,

                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.secondary],
                          ),

                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: Text(
                          item.value.toString(),

                          style: const TextStyle(
                            color: Colors.white,

                            fontSize: 18,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },

          loading: () {
            return const Center(child: CircularProgressIndicator());
          },

          error: (e, s) {
            return Center(child: Text(e.toString()));
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),

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
                  "آمار",

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

              // بک سمت چپ
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
