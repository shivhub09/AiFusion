import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchTodo() async {
  print("fetching");
  try {
    var reqBody = {
      "email": "shivnagori2020@gmail.com",
    };
    var response = await http.post(
      Uri.parse("http://192.168.146.65:3000/user/todos"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(reqBody),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      print("Failed with status code: ${response.statusCode}");
      return {"status": "failed", "message": "failed"};
    }
  } catch (e) {
    print("Error: $e");
    return {"status": "failed", "message": "failed"};
  }
}
