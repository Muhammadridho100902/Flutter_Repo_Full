class UserModel {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatarl;

  UserModel({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatarl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatarl: json['avatar'],
    );
  }
}