import 'dart:convert';
import 'package:demo/api/network_helper.dart';
import 'package:demo/model/products_model.dart';
import 'package:http/http.dart' as http;

// import 'package:providertask/helper/app_url.dart';

class ServiceClass {
  // static Future<Object> getTodoData(String apiName) async {
  static Future<Object> getTodoData() async {
    try {
      // var url = Uri.parse(appUrl.domain + apiName);
      var url = Uri.parse("https://dummyjson.com/todos");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          List<Product> todoList =
              decodedResponse.map((item) => Product.fromJson(item)).toList();
          return Success(code: 200, response: todoList);
        } else if (decodedResponse is Map<String, dynamic>) {
          Product todoModel = Product.fromJson(decodedResponse);
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
