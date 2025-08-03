class User {
  final String id;
  String email;

  User._({
    required this.id,
    required this.email,
  });

  factory User.create({
    required String email,
    required String id,
  }) {
    return User._(
      id: id,
      email: email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User._(
      id: json['id'],
      email: json['email'],
    );
  }
}