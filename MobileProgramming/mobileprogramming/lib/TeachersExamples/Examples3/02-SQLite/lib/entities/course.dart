// lib/models/course.dart
class Course {
  final int? id;
  final String name;
  final String code;

  Course({
    this.id,
    required this.name,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'],
      name: map['name'],
      code: map['code'],
    );
  }
}
