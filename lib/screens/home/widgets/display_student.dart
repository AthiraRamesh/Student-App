import 'dart:io';
import 'package:flutter/material.dart';
import './edit_student.dart';
import '../../../db/functions/db_functions.dart';

class DisplayStudent extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String number;
  final String photo;
  final int index;
  const DisplayStudent({
    super.key,
    required this.name,
    required this.age,
    required this.address,
    required this.number,
    required this.index,
    required this.photo,
    // required String photo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        actions: <Widget>[
          IconButton(
            onPressed: (() {
              showDialog(
                context: context,
                builder: ((context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AlertDialog(
                      title: const Text(
                        'Alert!',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      content: const Text(
                        "Do you want to delete this student",
                      ),
                      actions: [
                        TextButton(
                          onPressed: (() {
                            popoutfuction(context);
                            deleteStudent(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(20),
                                content: Text("Deleted"),
                              ),
                            );
                          }),
                          child: const Text('Yes'),
                        ),
                        TextButton(
                            onPressed: (() {
                              //popoutfuction(context);
                            }),
                            child: const Text('No'))
                      ],
                    ),
                  );
                }),
              );
            }),
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.white,
            ),
            tooltip: 'Delete',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Student Full Details',
                    style: TextStyle(fontSize: 25, color: Color(0xFF284350)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(
                    File(
                      photo,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Name: $name',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Age: $age',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Address: $address',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Phone Number: $number',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return EditStudent(
                            name: name,
                            age: age,
                            address: address,
                            number: number,
                            index: index,
                            image: photo,
                            photo: '');
                      })));
                    }),
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  popoutfuction(BuildContext context) {
    //return Navigator.of(context).pop();
    //return Navigator.pop(context);
    return Navigator.pushNamed(context, '/home');
  }
}
