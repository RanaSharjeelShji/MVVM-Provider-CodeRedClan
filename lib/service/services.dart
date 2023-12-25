import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvmlec/helper/app_url.dart';
import 'package:mvvmlec/helper/network_helper.dart';
import 'package:mvvmlec/models/todo_model.dart';

class ServiceClass {
  static Future<Object> getTodoData(String apiName) async {
    try {
      var url = Uri.parse(appUrl.domain+apiName);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          List<TodoModel> todoList =
              decodedResponse.map((item) => TodoModel.fromJson(item)).toList();
          return Success(code: 200, response: todoList);
        } else if (decodedResponse is Map<String, dynamic>) {
          TodoModel todoModel = TodoModel.fromJson(decodedResponse);
          return Success(code: 200, response: [todoModel]);
        } else {
          return Failure(
              code: response.statusCode,
              response: "Invalid Response Structure");
        }
      } else {
        return Failure(
            code: response.statusCode, response: "Invalid Response Coming");
      }
    } catch (e) {
      return "Invalid Response";
    }
  }
}
