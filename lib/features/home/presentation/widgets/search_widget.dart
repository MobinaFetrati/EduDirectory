import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  const SearchWidget({
    super.key,

    required this.controller,

    required this.onChanged,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_refresh);
  }

  void _refresh() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_refresh);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,

      onChanged: widget.onChanged,

      textAlign: TextAlign.right,

      style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),

      decoration: InputDecoration(
        hintText: "... جستجو",

        hintStyle: const TextStyle(
          color: AppColors.textSecondary,

          fontSize: 13,
        ),

        prefixIcon: widget.controller.text.isEmpty
            ? null
            : IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(4),

                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.12),

                    shape: BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.close,

                    size: 20,

                    color: AppColors.error,
                  ),
                ),

                onPressed: () {
                  widget.controller.clear();

                  widget.onChanged("");
                },
              ),

        suffixIcon: Container(
          margin: const EdgeInsets.all(5),

          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.12),

            shape: BoxShape.circle,
          ),

          child: const Icon(Icons.search, color: AppColors.primary),
        ),

        filled: true,

        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,

          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),

          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),

          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),

          borderSide: const BorderSide(
            color: AppColors.textSecondary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
