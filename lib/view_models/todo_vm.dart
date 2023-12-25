import 'package:flutter/material.dart';
import 'package:mvvmlec/helper/app_url.dart';
import 'package:mvvmlec/helper/network_helper.dart';
import 'package:mvvmlec/models/todo_model.dart';
import 'package:mvvmlec/service/services.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoModel> _todoModel = [];
  List<TodoModel> get todoModel => _todoModel;

  setTodoModel(List<TodoModel> todoModel) {
    _todoModel = todoModel;
    notifyListeners();
  }

  getTodoResponse() async {
    var finalResponse = await ServiceClass.getTodoData(appUrl.todo);
    if (finalResponse is Success) {
      setTodoModel(finalResponse.response as List<TodoModel>);
    }
    if(finalResponse is Failure){
      print(finalResponse.code);
    }
  }
}
