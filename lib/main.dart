import 'package:assignment_2/controllers/addAndRemove.dart';
import 'package:assignment_2/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
     return AAR();
    },
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),);
  }
}