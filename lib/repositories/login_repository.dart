import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vdds_mobile/models/login_response_model.dart';

class AuthenticateUserRepository {
  //Future searchByName(String firstName);

  Future<LoginModelResponse> authenticateUser(
      String username, String password) async {
    final response = await http.post(
      Uri.parse('192.168.1.113:8000/auth/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return LoginModelResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to authenticate user');
    }
  }
}
