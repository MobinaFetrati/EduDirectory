import 'package:edudirectory3/app/colors.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, required this.onSelected});

  final ValueChanged<List<String>> onSelected;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> selected = [];

  final Map<String, List<String>> groups = {
    "اداری": ["ریاست", "معاونت‌ها", "مناطق و اداره کل"],

    "مدارس": ["ابتدایی", "متوسطه دوره اول", "متوسطه دوره دوم"],

    "آموزشگاه‌های زبان و علمی": ["زبان", "علمی"],

    "مراکز رفاهی و خدماتی": [],
  };

  void toggle(String value) {
    setState(() {
      if (selected.contains(value)) {
        selected.remove(value);
      } else {
        selected.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: DraggableScrollableSheet(
        expand: false,

        initialChildSize: 0.75,

        builder: (_, controller) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),

                topRight: Radius.circular(35),
              ),
            ),

            child: Column(
              children: [
                // هدر
                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.symmetric(vertical: 20),

                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary],
                    ),

                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),

                      topRight: Radius.circular(20),
                    ),
                  ),

                  child: const Text(
                    "فیلتر اطلاعات کارکنان",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Expanded(
                  child: ListView.builder(
                    controller: controller,

                    padding: const EdgeInsets.symmetric(horizontal: 16),

                    itemCount: groups.length,

                    itemBuilder: (context, index) {
                      final entry = groups.entries.elementAt(index);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),

                        decoration: BoxDecoration(
                          color: AppColors.background,

                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),

                          title: Text(
                            entry.key,

                            style: const TextStyle(
                              fontWeight: FontWeight.bold,

                              color: AppColors.textPrimary,
                            ),
                          ),

                          leading: Container(
                            padding: const EdgeInsets.all(8),

                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.12),

                              shape: BoxShape.circle,
                            ),

                            child: const Icon(
                              Icons.account_tree,

                              color: AppColors.primary,

                              size: 20,
                            ),
                          ),

                          children: entry.value.map((item) {
                            return CheckboxListTile(
                              activeColor: AppColors.primary,

                              title: Text(
                                item,

                                style: const TextStyle(fontSize: 14),
                              ),

                              value: selected.contains(item),

                              onChanged: (_) {
                                toggle(item);
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),

                  child: SizedBox(
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

                      onPressed: () {
                        widget.onSelected(selected);

                        Navigator.pop(context);
                      },

                      child: const Text(
                        "اعمال فیلتر",

                        style: TextStyle(
                          fontSize: 16,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
