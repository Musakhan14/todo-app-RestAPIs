import 'dart:convert';

import 'package:http/http.dart' as http;

//All todo Api call will be  here
class TodoService {
  static Future<bool> deleteById(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode == 200;
  }

  static Future<List?> fetchTodo() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'];
      return result;
    } else {
      return null;
    }
  }

  static Future<bool> updateData(String id, Map body) async {
    //udate data to the sever
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    //show succes or fail based on status
    return response.statusCode == 200;
  }

  static Future<bool> submitData(Map body) async {
    //udate data to the sever
    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    //show succes or fail based on status
    return response.statusCode == 201;
  }
}
