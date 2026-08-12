import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';

import '../../services/admin_employee_service.dart';
import '../../../../shared/models/employee_model.dart';

class AddEmployeeScreen extends StatefulWidget {
  final EmployeeModel? employee;

  const AddEmployeeScreen({super.key, this.employee});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final group = TextEditingController();
  final job = TextEditingController();
  final unit = TextEditingController();
  final mobile = TextEditingController();
  final internalNumber = TextEditingController();
  final correspondenceCode = TextEditingController();
  final phone = TextEditingController();
  final location = TextEditingController();
  final address = TextEditingController();
  final education = TextEditingController();
  final janitorName = TextEditingController();
  final janitorMobile = TextEditingController();
  final description = TextEditingController();

  bool loading = false;

  bool get isEdit => widget.employee != null;

  @override
  void initState() {
    super.initState();

    if (isEdit) {
      final e = widget.employee!;

      firstName.text = e.firstName;
      lastName.text = e.lastName;
      group.text = e.group;
      job.text = e.jobTitle ?? "";
      unit.text = e.unitName ?? "";
      mobile.text = e.mobile ?? "";
      internalNumber.text = e.internalNumber ?? "";
      correspondenceCode.text = e.correspondenceCode ?? "";
      phone.text = e.phone ?? "";
      location.text = e.locationName ?? "";
      address.text = e.address ?? "";
      education.text = e.educationLevel ?? "";
      janitorName.text = e.janitorName ?? "";
      janitorMobile.text = e.janitorMobile ?? "";
      description.text = e.description ?? "";
    }
  }

  Future<void> save() async {
    if (firstName.text.isEmpty || lastName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("لطفاً نام و نام خانوادگی را وارد کنید")),
      );

      return;
    }

    setState(() {
      loading = true;
    });

    final employee = EmployeeModel(
      id: widget.employee?.id,

      firstName: firstName.text.trim(),

      lastName: lastName.text.trim(),

      group: group.text.trim(),

      jobTitle: job.text.trim(),

      unitName: unit.text.trim(),

      mobile: mobile.text.trim(),

      internalNumber: internalNumber.text.trim(),

      correspondenceCode: correspondenceCode.text.trim(),

      phone: phone.text.trim(),

      locationName: location.text.trim(),

      address: address.text.trim(),

      educationLevel: education.text.trim(),

      janitorName: janitorName.text.trim(),

      janitorMobile: janitorMobile.text.trim(),

      description: description.text.trim(),
    );

    if (isEdit) {
      await AdminEmployeeService.updateEmployee(employee);
    } else {
      await AdminEmployeeService.addEmployee(employee);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: _buildAppBar(),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 100,
            left: 20,
            right: 20,
            bottom: 30,
          ),

          child: Container(
            padding: const EdgeInsets.all(22),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(24),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),

                  blurRadius: 18,

                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Column(
              children: [
                Icon(
                  isEdit ? Icons.edit : Icons.person_add_alt_1,

                  size: 55,

                  color: AppColors.primary,
                ),

                const SizedBox(height: 12),

                Text(
                  isEdit ? "ویرایش اطلاعات کارمند" : "ثبت اطلاعات کارمند جدید",

                  style: const TextStyle(
                    fontSize: 20,

                    fontWeight: FontWeight.bold,

                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 25),

                _field(controller: firstName, title: "نام", icon: Icons.person),

                _field(
                  controller: lastName,
                  title: "نام خانوادگی",
                  icon: Icons.badge,
                ),

                _field(
                  controller: group,
                  title: "گروه سازمانی",
                  icon: Icons.account_tree,
                ),

                _field(controller: job, title: "پست سازمانی", icon: Icons.work),

                _field(controller: unit, title: "واحد", icon: Icons.apartment),

                _field(
                  controller: mobile,
                  title: "شماره همراه",
                  icon: Icons.phone_android,
                  keyboardType: TextInputType.phone,
                ),
                _field(
                  controller: phone,
                  title: "تلفن",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),

                _field(
                  controller: internalNumber,
                  title: "شماره داخلی",
                  icon: Icons.confirmation_number,
                ),

                _field(
                  controller: correspondenceCode,
                  title: "کد مکاتبات",
                  icon: Icons.numbers,
                ),

                _field(
                  controller: location,
                  title: "محل",
                  icon: Icons.location_on,
                ),

                _field(controller: address, title: "آدرس", icon: Icons.home),

                _field(
                  controller: education,
                  title: "تحصیلات",
                  icon: Icons.school,
                ),

                _field(
                  controller: janitorName,
                  title: "نام خدمتگزار",
                  icon: Icons.person_outline,
                ),

                _field(
                  controller: janitorMobile,
                  title: "موبایل خدمتگزار",
                  icon: Icons.phone_android,
                  keyboardType: TextInputType.phone,
                ),

                _field(
                  controller: description,
                  title: "توضیحات",
                  icon: Icons.description,
                  maxLines: 3,
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,

                  height: 55,

                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,

                      foregroundColor: Colors.white,

                      elevation: 3,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    icon: loading
                        ? const SizedBox(
                            width: 20,

                            height: 20,

                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.save),

                    label: Text(
                      loading
                          ? "در حال ذخیره..."
                          : isEdit
                          ? "ذخیره تغییرات"
                          : "ذخیره اطلاعات",
                    ),

                    onPressed: loading ? null : save,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),

      child: Container(
        height: 110,

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
              Text(
                isEdit ? "ویرایش کارمند" : "افزودن کارمند",

                style: const TextStyle(
                  color: Colors.white,

                  fontSize: 21,

                  fontWeight: FontWeight.bold,
                ),
              ),

              Positioned(
                right: 18,

                child: Image.asset(
                  "assets/images/logo.png",

                  width: 55,

                  height: 55,

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

  Widget _field({
    required TextEditingController controller,

    required String title,

    required IconData icon,

    TextInputType? keyboardType,

    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: TextField(
        controller: controller,

        keyboardType: keyboardType,

        maxLines: maxLines,

        textAlign: TextAlign.right,

        decoration: InputDecoration(
          labelText: title,

          floatingLabelStyle: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),

          prefixIcon: Container(
            margin: const EdgeInsets.all(6),

            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.12),

              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(icon, color: AppColors.primary),
          ),

          filled: true,

          fillColor: const Color(0xffF7FAFA),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),

            borderSide: BorderSide(color: AppColors.primary.withOpacity(.15)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),

            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
