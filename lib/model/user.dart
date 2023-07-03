import 'dart:convert';

class User {
  final String id;
  final String username;
  final String password;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'username': username});
    result.addAll({'password': password});
    result.addAll({'token': token});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? username,
    String? password,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, password: $password, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.username == username &&
      other.password == password &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      password.hashCode ^
      token.hashCode;
  }
}
