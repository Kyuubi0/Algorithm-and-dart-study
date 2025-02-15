// lib/models/student.dart
class Student {
  final int? id;
  final String name;
  final String number;

  Student({
    this.id,
    required this.name,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      number: map['number'],
    );
  }
}
