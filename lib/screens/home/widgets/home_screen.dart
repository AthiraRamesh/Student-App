import 'package:flutter/material.dart';
import '../../../db/functions/db_functions.dart';
import './students_list.dart';
import './search_screen.dart';
import './add_student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getallstudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchWidget(),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: const ListStudents(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddStudentClass();
              },
            ),
          );
        },
        tooltip: 'Add students',
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.teal,
        ),
      ),
    );
  }
}
