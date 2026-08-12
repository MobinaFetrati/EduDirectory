import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/admin_employee_service.dart';
import '../../../../shared/models/employee_model.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  late Future<List<EmployeeModel>> future;

  @override
  void initState() {
    super.initState();

    future = AdminEmployeeService.getEmployees();
  }

  Future<void> refresh() async {
    setState(() {
      future = AdminEmployeeService.getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: _buildAppBar(),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,

        foregroundColor: Colors.white,

        elevation: 5,

        icon: const Icon(Icons.person_add),

        label: const Text(
          "افزودن",

          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        onPressed: () async {
          await context.push("/admin/add");

          refresh();
        },
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: FutureBuilder<List<EmployeeModel>>(
          future: future,

          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final employees = snapshot.data ?? [];

            if (employees.isEmpty) {
              return const Center(
                child: Text(
                  "هیچ مخاطبی ثبت نشده است.",

                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: refresh,

              child: ListView.builder(
                padding: const EdgeInsets.only(
                  top: 110,

                  right: 15,

                  left: 15,

                  bottom: 90,
                ),

                itemCount: employees.length,

                itemBuilder: (context, index) {
                  final employee = employees[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(20),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),

                          blurRadius: 12,

                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,

                        vertical: 8,
                      ),

                      leading: CircleAvatar(
                        radius: 28,

                        backgroundColor: AppColors.primary.withOpacity(0.12),

                        backgroundImage: employee.photoUrl != null
                            ? NetworkImage(employee.photoUrl!)
                            : null,

                        child: employee.photoUrl == null
                            ? const Icon(Icons.person, color: AppColors.primary)
                            : null,
                      ),

                      title: Text(
                        "${employee.firstName} ${employee.lastName}",

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,

                          fontSize: 16,
                        ),
                      ),

                      subtitle: Text(
                        employee.jobTitle ?? "",

                        style: const TextStyle(color: AppColors.textSecondary),
                      ),

                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),

                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: "edit",

                            child: Row(
                              children: [
                                Icon(Icons.edit),

                                SizedBox(width: 8),

                                Text("ویرایش"),
                              ],
                            ),
                          ),

                          const PopupMenuItem(
                            value: "delete",

                            child: Row(
                              children: [
                                Icon(Icons.delete),

                                SizedBox(width: 8),

                                Text("حذف"),
                              ],
                            ),
                          ),
                        ],

                        onSelected: (value) async {
                          if (value == "edit") {
                            context.push("/admin/edit", extra: employee);
                          }

                          if (value == "delete") {
                            final ok = await _deleteDialog(context);

                            if (ok == true) {
                              await AdminEmployeeService.deleteEmployee(
                                employee.id!,
                              );

                              refresh();
                            }
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool?> _deleteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),

          title: const Text("حذف کارمند"),

          content: const Text(
            "آیا مطمئن هستید که می‌خواهید این مورد را حذف کنید؟",
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },

              child: const Text("انصراف"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,

                foregroundColor: Colors.white,
              ),

              onPressed: () {
                Navigator.pop(context, true);
              },

              child: const Text("حذف"),
            ),
          ],
        );
      },
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
              const Center(
                child: Text(
                  "مدیریت مخاطبین",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Positioned(
                right: 20,

                child: Image.asset(
                  "assets/images/logo.png",

                  width: 45,

                  height: 45,

                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.account_balance,

                      color: Colors.white,

                      size: 40,
                    );
                  },
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
