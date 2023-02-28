class SignUpModel{
  final String? name;
  final String? email;
  final String? password;
  final String? profilePicture;
  final String? pin;
  final String? ktp;

  SignUpModel({
    this.name,
    this.email,
    this.password,
    this.profilePicture,
    this.pin,
    this.ktp
  });

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'email' : email,
      'password' : password,
      'profilePicture' : profilePicture,
      'pin' : pin,
      'ktp' : ktp,
    };
  }

  SignUpModel copyWith({
    String? name,
    String? email,
    String? password,
    String? pin,
    String? profilePicture,
    String? ktp,
  }) =>
  SignUpModel(
    name: name ?? this.name,
    email: email ?? this.email,
    password: password,
    pin: pin ?? this.pin,
    profilePicture: profilePicture ?? this.profilePicture,
    ktp: ktp ?? this.ktp
  );
}