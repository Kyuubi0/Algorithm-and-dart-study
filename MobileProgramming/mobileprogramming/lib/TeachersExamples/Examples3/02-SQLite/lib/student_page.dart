// lib/screens/student_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_helper.dart';

class StudentPage extends StatefulWidget {
  @override
  State<StudentPage> createState() => StudentPageState();
}

class StudentPageState extends State<StudentPage> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    final list = await dbHelper.getStudents();
    setState(() => students = list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showStudentDialog(),
          ),
        ],
      ),
      body: students.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_off, size: 50, color: Colors.grey),
                  SizedBox(height: 10),
                  Text('No records'),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => showStudentDialog(),
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        student['name'][0].toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(student['name']),
                    subtitle: Text('StdNo: ${student['number']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => showStudentDialog(student: student),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteStudent(student),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<void> showStudentDialog({Map<String, dynamic>? student}) async {
    final nameController = TextEditingController(text: student?['name'] ?? '');
    final numberController =
        TextEditingController(text: student?['number'] ?? '');

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(student == null ? 'Add Student' : 'Update Student'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isEmpty ||
                  numberController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fill the all inputs')),
                );
                return;
              }

              final data = {
                'name': nameController.text,
                'number': numberController.text,
              };

              if (student != null) {
                data['id'] = student['id'].toString();
                await dbHelper.updateStudent(data);
              } else {
                await dbHelper.insertStudent(data);
              }

              Navigator.pop(context);
              loadStudents();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> deleteStudent(Map<String, dynamic> student) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Student'),
        content: Text(
            '${student['name']} will be deleted. Are you sure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await dbHelper.deleteStudent(student['id']);
      loadStudents();
    }
  }
}
