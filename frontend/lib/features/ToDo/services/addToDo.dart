import 'dart:convert';

import 'package:frontend/services/email.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> addToDo(String description) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  print("adding");
  try {
    var reqBody = {
      "email": email,
      "description": description,
    };

    var response = await http.post(
      Uri.parse("http://192.168.21.65:3000/user/addToDo"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(reqBody),
    );

    if (response.statusCode == 201) {
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
