import 'package:demo/api/network.dart';
import 'package:demo/api/network_helper.dart';
import 'package:demo/model/products_model.dart';
import 'package:flutter/material.dart';

class TodoViewModel extends ChangeNotifier {
  List<Product> _todoModel = [];
  List<Product> get todoModel => _todoModel;

  setTodoModel(List<Product> todoModel) {
    _todoModel = todoModel;
    notifyListeners();
  }

  getTodoResponse() async {
    // var finalResponse = await ServiceClass.getTodoData(appUrl.todo);
    var finalResponse = await ServiceClass.getTodoData();

    if (finalResponse is Success) {
      setTodoModel(finalResponse.response as List<Product>);
    }
    if (finalResponse is Failure) {
      print(finalResponse.code);
    }
  }
}
