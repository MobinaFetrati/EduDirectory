import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSearch;
  final VoidCallback? onMenu;
  final VoidCallback? onFilter;

  const HomeAppBar({super.key, this.onSearch, this.onMenu, this.onFilter});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(95),

      child: Container(
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
                  "EduDirectory",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 19,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // لوگو سمت چپ
              Positioned(
                left: 18,

                child: Container(
                  width: 52,

                  height: 52,

                  padding: const EdgeInsets.all(5),

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

                        size: 35,
                      );
                    },
                  ),
                ),
              ),

              // منوی همبرگری سمت راست
              Positioned(
                right: 18,

                child: InkWell(
                  borderRadius: BorderRadius.circular(50),

                  onTap: () {
                    Scaffold.of(context).openEndDrawer();

                    onMenu?.call();
                  },

                  child: Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.menu,

                      color: Colors.white,

                      size: 26,
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

  // Widget _iconButton({required IconData icon, VoidCallback? onTap}) {
  //   return InkWell(
  //     borderRadius: BorderRadius.circular(50),

  //     onTap: onTap,

  //     child: Container(
  //       padding: const EdgeInsets.all(8),

  //       decoration: BoxDecoration(
  //         color: Colors.white.withOpacity(0.18),

  //         shape: BoxShape.circle,
  //       ),

  //       child: Icon(icon, color: Colors.white, size: 22),
  //     ),
  //   );
  // }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
