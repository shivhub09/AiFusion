import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> summarize(String text) async {
  try {
    var reqBody = {"text": text};
    var response = await http.post(
      Uri.parse("http://192.168.21.65:8080/summarizeText"),
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
    return {"status": "failed", "message": "failed"};
  }
}
