class Users {
  final String? id;
  final String? email;
  final String? username;
  final String? name;
  final String? bio;
  final String? avatarUrl;
  final DateTime createdAt;

  Users({
    required this.id,
    required this.email,
    required this.username,
    required this.name,
    required this.bio,
    required this.avatarUrl,
    required this.createdAt,
  });
}
