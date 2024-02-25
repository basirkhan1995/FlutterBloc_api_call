import 'dart:convert';
import 'package:flutter_todo_using_bloc/Model/todos.dart';
 import 'package:http/http.dart' as http;
class Repository{

  //Get method
  Future<List<Todo>> get()async{
    const url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) => Todo.fromMap(e)).toList();
      return todos;
    }else{
      throw _response(response);
    }
  }

  dynamic _response(http.Response response){
    switch(response.statusCode){
      case 404: throw "Address not found";

      default: "Something went wrong: ${response.statusCode}";
    }
  }
 }