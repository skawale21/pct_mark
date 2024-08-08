import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl;
  String? token;

  HttpService({required this.baseUrl, this.token});

  void setToken(String newToken) {
    token = newToken;
  }

  // Map<String, String> _getHeaders() {
  //   return {
  //     'Content-Type': 'application/json',
  //     if (token != null) 'Authorization': 'Bearer $token',
  //   };
  // }

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'token': '$token',
    };
  }

  Future<dynamic> get(String endpoint) async {
    var response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: _getHeaders(),
    );

    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, {required dynamic data}) async {
    var response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      body: jsonEncode(data),
      headers: _getHeaders(),
    );

    return _handleResponse(response);
  }

  Future<dynamic> put(String endpoint, {required dynamic data}) async {
    var response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: _getHeaders(),
    );

    return _handleResponse(response);
  }

  Future<dynamic> delete(String endpoint) async {
    var response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
      headers: _getHeaders(),
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var body = jsonDecode(response.body);
      throw Exception(
        body['message'] ?? 'Failed to load data',
      );
    }
  }
}


/*class UserRepository {
  final HttpService httpService;

  UserRepository({required this.httpService});

  Future<void> login(String username, String password) async {
    try {
      var loginData = await httpService.post('auth/login', data: {
        'username': username,
        'password': password,
      });

      // Assuming the token is in the 'token' field of the response
      String token = loginData['token'];
      httpService.setToken(token);
    } catch (e) {
      // Handle error
      throw e;
    }
  }

  Future<User> getUserById(int userId) async {
    try {
      var userData = await httpService.get('users/$userId');
      return User.fromJson(userData);
    } catch (e) {
      // Handle error
      throw e;
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await httpService.put('users/${user.id}', data: user.toJson());
    } catch (e) {
      // Handle error
      throw e;
    }
  }
}
 */
