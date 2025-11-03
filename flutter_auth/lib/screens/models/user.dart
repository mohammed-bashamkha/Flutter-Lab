class User {
  String name;
  String email;
  String avatarUrl;

  User({required this.name, required this.email, required this.avatarUrl});
 User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        avatarUrl = json['avatar_url'];
 
}
