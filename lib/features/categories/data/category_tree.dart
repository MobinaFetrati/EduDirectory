class CategoryTree {
  final String title;
  final List<CategoryTree> children;

  const CategoryTree({required this.title, this.children = const []});
}

const List<CategoryTree> educationCategoryTree = [
  CategoryTree(
    title: 'اداری',
    children: [
      CategoryTree(title: 'ریاست'),

      CategoryTree(
        title: 'معاونت‌ها',
        children: [
          CategoryTree(title: 'آموزش ابتدایی'),

          CategoryTree(title: 'آموزش متوسطه'),

          CategoryTree(title: 'تربیت بدنی و پرورشی'),

          CategoryTree(title: 'توسعه مدیریت و پشتیبانی'),

          CategoryTree(title: 'پژوهش و آموزش نیروی انسانی'),
        ],
      ),

      CategoryTree(title: 'مناطق و اداره کل'),
    ],
  ),

  CategoryTree(
    title: 'مدارس',
    children: [
      CategoryTree(
        title: 'ابتدایی',
        children: [
          CategoryTree(
            title: 'دولتی',
            children: [
              CategoryTree(title: 'پسرانه'),
              CategoryTree(title: 'دخترانه'),
            ],
          ),

          CategoryTree(
            title: 'غیردولتی',
            children: [
              CategoryTree(title: 'پسرانه'),
              CategoryTree(title: 'دخترانه'),
            ],
          ),
        ],
      ),

      CategoryTree(
        title: 'متوسطه دوره اول',
        children: [
          CategoryTree(
            title: 'دولتی',
            children: [
              CategoryTree(title: 'پسرانه'),
              CategoryTree(title: 'دخترانه'),
            ],
          ),

          CategoryTree(
            title: 'غیردولتی',
            children: [
              CategoryTree(title: 'پسرانه'),
              CategoryTree(title: 'دخترانه'),
            ],
          ),
        ],
      ),

      CategoryTree(
        title: 'متوسطه دوره دوم',
        children: [
          CategoryTree(
            title: 'نظری',
            children: [
              CategoryTree(
                title: 'دولتی',
                children: [
                  CategoryTree(title: 'پسرانه'),
                  CategoryTree(title: 'دخترانه'),
                ],
              ),

              CategoryTree(
                title: 'غیردولتی',
                children: [
                  CategoryTree(title: 'پسرانه'),
                  CategoryTree(title: 'دخترانه'),
                ],
              ),
            ],
          ),

          CategoryTree(
            title: 'فنکار',
            children: [
              CategoryTree(
                title: 'دولتی',
                children: [
                  CategoryTree(title: 'پسرانه'),
                  CategoryTree(title: 'دخترانه'),
                ],
              ),

              CategoryTree(
                title: 'غیردولتی',
                children: [
                  CategoryTree(title: 'پسرانه'),
                  CategoryTree(title: 'دخترانه'),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  CategoryTree(
    title: 'آموزشگاه‌های زبان و علمی',
    children: [
      CategoryTree(
        title: 'زبان',
        children: [
          CategoryTree(title: 'پسرانه'),
          CategoryTree(title: 'دخترانه'),
        ],
      ),

      CategoryTree(
        title: 'علمی',
        children: [
          CategoryTree(title: 'پسرانه'),
          CategoryTree(title: 'دخترانه'),
        ],
      ),
    ],
  ),

  CategoryTree(title: 'مراکز رفاهی و خدماتی'),
];
