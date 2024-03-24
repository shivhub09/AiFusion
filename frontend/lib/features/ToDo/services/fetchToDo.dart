import 'dart:convert';
import 'package:frontend/services/email.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> fetchTodo() async {
  print("fetching");
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');

    var reqBody = {
      "email": email,
    };

    var response = await http.post(
      Uri.parse("http://192.168.26.65:3000/user/getToDo"),
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
