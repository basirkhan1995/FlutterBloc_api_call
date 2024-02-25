import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_using_bloc/TodoBloc/todo_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),

      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (
            BuildContext context, state) {
           //Our first state is emitting
           if(state is TodoLoadingState || state is TodoInitial){
             return const Center(
               child: CircularProgressIndicator(),
             );
           }else if (state is TodoErrorState){
             return Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(state.error.toString()),
                   
                   IconButton(
                       onPressed: ()=> context.read<TodoBloc>().add(TodoResponseEvent()),
                       icon: const Icon(Icons.refresh))
                 ],
               ),
             );
           }else if (state is TodoLoadedState){
             final todos = state.todos;
             return ListView.builder(
                 itemCount: todos.length,
                 itemBuilder: (context,index){
               return ListTile(
                 leading: CircleAvatar(
                   child: Text(todos[index].id.toString()),
                 ),
                 title: Text(todos[index].title),
               );
             });
           }
          return Container();
        },
      ),
    );
  }
}
