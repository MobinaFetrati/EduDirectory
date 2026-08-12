class EmployeeModel {
  final int? id;

  final String firstName;
  final String lastName;

  final String? photoUrl;

  /// ساختار دسته‌بندی
  final String group;
  final String? level1;
  final String? level2;
  final String? level3;
  final String? level4;

  final String? jobTitle;

  final String? unitName;

  final String? internalNumber;

  final String? correspondenceCode;

  final String? phone;

  final String? mobile;

  final String? locationName;

  final double? latitude;

  final double? longitude;

  final String? address;

  final String? educationLevel;

  final String? janitorName;

  final String? janitorMobile;

  final int? categoryId;

  final String? description;

  final bool isActive;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  const EmployeeModel({
    this.id,
    required this.firstName,
    required this.lastName,

    required this.group,
    this.level1,
    this.level2,
    this.level3,
    this.level4,

    this.photoUrl,
    this.jobTitle,
    this.unitName,
    this.internalNumber,
    this.correspondenceCode,
    this.phone,
    this.mobile,
    this.locationName,
    this.latitude,
    this.longitude,
    this.address,
    this.educationLevel,
    this.janitorName,
    this.janitorMobile,
    this.categoryId,
    this.description,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  EmployeeModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? photoUrl,
    String? group,
    String? level1,
    String? level2,
    String? level3,
    String? level4,
    String? jobTitle,
    String? unitName,
    String? internalNumber,
    String? correspondenceCode,
    String? phone,
    String? mobile,
    String? locationName,
    double? latitude,
    double? longitude,
    String? address,
    String? educationLevel,
    String? janitorName,
    String? janitorMobile,
    int? categoryId,
    String? description,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      photoUrl: photoUrl ?? this.photoUrl,
      group: group ?? this.group,
      level1: level1 ?? this.level1,
      level2: level2 ?? this.level2,
      level3: level3 ?? this.level3,
      level4: level4 ?? this.level4,
      jobTitle: jobTitle ?? this.jobTitle,
      unitName: unitName ?? this.unitName,
      internalNumber: internalNumber ?? this.internalNumber,
      correspondenceCode: correspondenceCode ?? this.correspondenceCode,
      phone: phone ?? this.phone,
      mobile: mobile ?? this.mobile,
      locationName: locationName ?? this.locationName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      educationLevel: educationLevel ?? this.educationLevel,
      janitorName: janitorName ?? this.janitorName,
      janitorMobile: janitorMobile ?? this.janitorMobile,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],

      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',

      group: json['group'] ?? '',

      level1: json['level1'],
      level2: json['level2'],
      level3: json['level3'],
      level4: json['level4'],

      photoUrl: json['photo_url'],

      jobTitle: json['job_title'],

      unitName: json['unit_name'],

      internalNumber: json['internal_number'],

      correspondenceCode: json['correspondence_code'],

      phone: json['phone'],

      mobile: json['mobile'],

      locationName: json['location_name'],

      latitude: json['latitude']?.toDouble(),

      longitude: json['longitude']?.toDouble(),

      address: json['address'],

      educationLevel: json['education_level'],

      janitorName: json['janitor_name'],

      janitorMobile: json['janitor_mobile'],

      categoryId: json['category_id'],

      description: json['description'],

      isActive: json['is_active'] ?? true,

      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,

      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,

      'last_name': lastName,

      'group': group,

      'level1': level1,

      'level2': level2,

      'level3': level3,

      'level4': level4,

      'photo_url': photoUrl,

      'job_title': jobTitle,

      'unit_name': unitName,

      'internal_number': internalNumber,

      'correspondence_code': correspondenceCode,

      'phone': phone,

      'mobile': mobile,

      'location_name': locationName,

      'latitude': latitude,

      'longitude': longitude,

      'address': address,

      'education_level': educationLevel,

      'janitor_name': janitorName,

      'janitor_mobile': janitorMobile,

      'category_id': categoryId,

      'description': description,

      'is_active': isActive,
    };
  }
}
