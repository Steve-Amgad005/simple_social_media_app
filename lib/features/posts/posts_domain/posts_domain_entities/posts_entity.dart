class Post {
  final String? text; // النص لو موجود
  final String? imageUrl; // رابط الصورة لو موجود
  final String authorName;
  final String authorAvatar;
  final DateTime createdAt;

  Post({
    required this.authorName,
    required this.authorAvatar,
    this.text,
    this.imageUrl,
    required this.createdAt,
  });
}
