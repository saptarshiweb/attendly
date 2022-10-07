class UserRegister {
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String password2;

  UserRegister({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.password2,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
      password2: json['password2'],
    );
  }
}
