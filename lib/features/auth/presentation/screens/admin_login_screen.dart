import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/admin_auth_service.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool loading = false;

  Future<void> login() async {
    setState(() {
      loading = true;
    });

    final result = await AdminAuthService.login(
      emailController.text.trim(),

      passwordController.text.trim(),
    );

    if (mounted) {
      setState(() {
        loading = false;
      });
    }

    if (!mounted) return;

    if (result) {
      context.go('/admin');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("اطلاعات ورود صحیح نیست")));
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),

            child: Container(
              padding: const EdgeInsets.all(25),

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
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.12),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.admin_panel_settings,

                      size: 55,

                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "ورود مدیر سیستم",

                    style: TextStyle(
                      fontSize: 21,

                      fontWeight: FontWeight.bold,

                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    controller: emailController,

                    textAlign: TextAlign.right,

                    decoration: InputDecoration(
                      labelText: "ایمیل",

                      prefixIcon: const Icon(
                        Icons.email,

                        color: AppColors.primary,
                      ),

                      filled: true,

                      fillColor: AppColors.background,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: passwordController,

                    obscureText: true,

                    textAlign: TextAlign.right,

                    decoration: InputDecoration(
                      labelText: "رمز عبور",

                      prefixIcon: const Icon(
                        Icons.lock,

                        color: AppColors.primary,
                      ),

                      filled: true,

                      fillColor: AppColors.background,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,

                    height: 55,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,

                        foregroundColor: Colors.white,

                        elevation: 4,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),

                      onPressed: loading ? null : login,

                      child: loading
                          ? const SizedBox(
                              width: 22,

                              height: 22,

                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "ورود به پنل مدیریت",

                              style: TextStyle(
                                fontSize: 16,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                  "ورود مدیر",

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
