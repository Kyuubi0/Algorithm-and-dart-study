// lib/models/student_course.dart
class StudentCourse {
  final int studentId;
  final int courseId;

  StudentCourse({
    required this.studentId,
    required this.courseId,
  });

  Map<String, dynamic> toMap() {
    return {
      'student_id': studentId,
      'course_id': courseId,
    };
  }
}
