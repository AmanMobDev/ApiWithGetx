import 'dart:convert';

/// In this class we can declare our request as per our need.
class DummyRequest {
  String? username;
  String? password;

  DummyRequest(this.username, this.password);

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
