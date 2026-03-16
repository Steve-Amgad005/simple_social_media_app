import 'package:simple_social_media_app/features/auth/auth_domain/auth_domain_entities/user_entity.dart';

class UserModel extends Users {
  UserModel({
    required super.id,
    required super.email,
    required super.username,
    required super.name,
    required super.bio,
    required super.avatarUrl,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      username: json["username"],
      name: json["name"],
      bio: json["bio"] ?? "",
      avatarUrl: json["avatarUrl"] ?? "",
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}