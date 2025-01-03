class User {
  final String username;
  final String name;
  final int id;

  User({
    required this.username,
    required this.name,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['Username'] ?? json['username'] ?? '',
      name: json['Name'] ?? json['name'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
