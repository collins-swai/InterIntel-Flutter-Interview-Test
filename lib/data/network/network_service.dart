import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:interintel/core/model/response/TodoResponse.dart';

class NetworkService{
  static final BASE_URL = "https://jsonplaceholder.typicode.com/todos?_limit=5";


  Future<List<TodoResponse>> getTodo() async {
    var uri = Uri.parse(BASE_URL);
    Map<String, String> requestHeaders = {

    };
    try {
      var response = await http.get(uri);
      log(response.body.toString());
      print(response.body);
      print(response.request);
      print(response.headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body) as List<dynamic>;
        var res = data.map((e) => TodoResponse.fromJson(e)).toList();
        return res;
      } else {
        throw Exception("Error ${response.body}");
      }
    } catch (e) {
      log(e.toString());
      throw Exception("Error $e");
    }
  }
}