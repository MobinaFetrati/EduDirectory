import 'package:edudirectory3/app/colors.dart';
import 'package:edudirectory3/features/home/presentation/providers/filter_provider.dart';
import 'package:edudirectory3/features/home/presentation/providers/filtered_employee_provider.dart';
import 'package:edudirectory3/features/home/presentation/widgets/home_filter_bar.dart';
import 'package:edudirectory3/features/search/presentation/providers/search_provider.dart';
import 'package:edudirectory3/shared/providers/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/employee_list.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/search_widget.dart';

import '../../../menu/presentation/widgets/app_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void openFilter() {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      builder: (_) {
        return FilterBottomSheet(
          onSelected: (value) {
            ref.read(selectedFilterProvider.notifier).state = value;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final employees = ref.watch(filteredEmployeesProvider);

    return Scaffold(
      backgroundColor: const Color(0xffEEF5F4),

      appBar: HomeAppBar(onSearch: () {}, onMenu: () {}, onFilter: openFilter),

      endDrawer: const AppDrawer(),

      body: Padding(
        padding: const EdgeInsets.only(top: 12),

        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),

              padding: const EdgeInsets.all(1),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(22),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),

                    blurRadius: 15,

                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: SearchWidget(
                controller: controller,

                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
              ),
            ),

            const SizedBox(height: 12),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              padding: const EdgeInsets.all(8),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffE3F2FD), Color(0xffE8F5E9)],

                  begin: Alignment.centerRight,

                  end: Alignment.centerLeft,
                ),

                borderRadius: BorderRadius.circular(22),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),

                    blurRadius: 12,

                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),

                    onTap: openFilter,

                    child: Container(
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.12),

                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.filter_alt_outlined,

                        color: AppColors.primary,

                        size: 22,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Expanded(child: HomeFilterBar()),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(employeesProvider);
                  ref.invalidate(filteredEmployeesProvider);
                  await ref.read(filteredEmployeesProvider.future);
                },
                child: employees.when(
                  data: (data) {
                    return EmployeeList(employees: data);
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (error, stack) {
                    return Center(child: Text(error.toString()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
