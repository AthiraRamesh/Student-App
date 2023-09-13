import 'package:flutter/material.dart';
import './screens/home/widgets/home_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import './db/model/data_model.dart';

void main() async {
  //hive
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StudentModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/home': (context) => const HomeScreen(),
        //named routing
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}
