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

//Login User
class UserLogin {
  final String email;
  final String password;

  UserLogin({
    required this.email,
    required this.password,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      email: json['email'],
      password: json['password'],
    );
  }
}

//Response Message for Logging In

class LoginResponseMessage {
  final bool isAuth;
  final String message;
  final String email;
  final String name;

  LoginResponseMessage({
    required this.isAuth,
    required this.message,
    required this.email,
    required this.name,
  });

  factory LoginResponseMessage.fromJson(Map<String, dynamic> json) {
    return LoginResponseMessage(
        isAuth: json['isAuth'],
        message: json['message'],
        email: json['email'],
        name: json['name']);
  }
}
//Profile logged In

class RegisterResponseMessage {
  final bool auth;
  final String message;

  RegisterResponseMessage({
    required this.auth,
    required this.message,
  });

  factory RegisterResponseMessage.fromJson(Map<String, dynamic> json) {
    return RegisterResponseMessage(
      auth: json['auth'],
      message: json['message'],
    );
  }
}
