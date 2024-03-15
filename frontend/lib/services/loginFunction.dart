import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> loginUser(String email, String password) async {
  try {
    var reqBody = {"email": email, "password": password};
    var response = await http.post(
      Uri.parse("http://192.168.61.65:3000/user/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(reqBody),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      // Handle non-200 status code
      print("Failed with status code: ${response.statusCode}");
      return {"status": "failed", "message": "failed"};
    }
  } catch (e) {
    // Handle exceptions
    print("Error: $e");
    return {"status": "failed", "message": "failed"};

  }
}
