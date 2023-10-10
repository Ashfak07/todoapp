import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/model/my_list%20_model.dart';
import 'package:todoapp/views/home_screen/home_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MyListModelAdapter());
  var box = await Hive.openBox('localDb');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomeScreen());
  }
}
