class CategoryModel {
  final int? id;

  final String name;

  final int? parentId;

  final int level;

  final int sortOrder;

  final bool isActive;

  final DateTime? createdAt;

  const CategoryModel({
    this.id,
    required this.name,
    this.parentId,
    required this.level,
    this.sortOrder = 0,
    this.isActive = true,
    this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      parentId: json['parent_id'],
      level: json['level'],
      sortOrder: json['sort_order'] ?? 0,
      isActive: json['is_active'] ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'parent_id': parentId,
      'level': level,
      'sort_order': sortOrder,
      'is_active': isActive,
    };
  }
}
