import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('http://10.0.2.2/login_api/login.php');

    try {
      final response = await http.post(
        url,
        body: {'email': email.trim(), 'password': hashPassword(password)},
      );

      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      return {'status': 500, 'message': e.toString()};
    }
  }
}
