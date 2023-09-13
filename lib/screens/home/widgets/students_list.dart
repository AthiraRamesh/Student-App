import 'dart:io';
import 'package:flutter/material.dart';
import './display_student.dart';
import '../../../db/functions/db_functions.dart';

class ListStudents extends StatefulWidget {
  const ListStudents({super.key});

  @override
  State<ListStudents> createState() => _ListStudentsState();
}

class _ListStudentsState extends State<ListStudents> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (ctx, studentModel, Widget? child) {
        return ListView.separated(
            itemBuilder: ((context, index) {
              final data = studentModel[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(
                      File(data.photo),
                    ),
                  ),
                  title: Text(data.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return DisplayStudent(
                            name: data.name,
                            age: data.age,
                            address: data.address,
                            number: data.phnNumber,
                            index: index,
                            photo: data.photo,
                          );
                        }),
                      ),
                    );
                  },
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
            itemCount: studentModel.length);
      },
    );
  }
}
