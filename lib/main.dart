import 'package:flutter/material.dart';
import 'package:mvvmlec/view/home.dart';
import 'package:mvvmlec/view_models/todo_vm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>TodoViewModel())
      ],
    child: const MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
