class User {
  final int? id;
  final String login;
  final String password;

  User({this.id, required this.login, required this.password});

  User copyWith({
    int? id,
    String? login,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }
}
