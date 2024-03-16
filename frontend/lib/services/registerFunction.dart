import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> registerUser(
    String email, String name, String password) async {
  try {
    var reqBody = {"email": email, "name": name, "password": password};
    var response = await http.post(
      Uri.parse("http://192.168.5.65:3000/user/registration"),
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

    // throw e;
  }
}
