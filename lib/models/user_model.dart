class User {
  int id;
  String email, firstName, lastName, avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    avatar: json['avatar'],
  );
}
