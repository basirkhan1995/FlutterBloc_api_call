import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_using_bloc/TodoBloc/todo_bloc.dart';
import 'package:flutter_todo_using_bloc/TodoView/todo_view.dart';
import 'Repository/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //When we run the app - on the start loads the todos
    return BlocProvider(
      create: (context) => TodoBloc(Repository())..add(TodoResponseEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoView(),
      ),
    );
  }
}
