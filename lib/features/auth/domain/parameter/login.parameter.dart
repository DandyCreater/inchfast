class LoginParameter {
  final String? username;
  final String? password;

  const LoginParameter({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'Username': username,
        'Password': password,
      };
}
