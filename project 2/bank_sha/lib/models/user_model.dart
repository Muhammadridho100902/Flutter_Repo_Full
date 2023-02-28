class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  String? password;
  final int? verified;
  final String? profilePicture;
  final String? ktp;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.password,
    this.verified,
    this.profilePicture,
    this.ktp,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      verified: json['verified'],
      profilePicture: json['profile_picture'],
      ktp: json['ktp'],
      balance: json['balance'],
      cardNumber: json['card_number'],
      pin: json['pin'],
      token: json['token'],
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? username,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        email: email ?? this.email,
        name: name ?? this.name,
        pin: pin ?? this.pin,
        password: password ?? this.password,
        balance: balance ?? this.balance,
        verified: verified,
        profilePicture: profilePicture,
        cardNumber: cardNumber,
        token: token,
      );
}
