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

  LoginResponseMessage({
    required this.isAuth,
    required this.message,
  });

  factory LoginResponseMessage.fromJson(Map<String, dynamic> json) {
    return LoginResponseMessage(
      isAuth: json['isAuth'],
      message: json['message'],
    );
  }
}
//Profile logged In

class ProfileLoggedIn {
  final bool isAuth;
  final String id;
  final String email;
  final String name;

  ProfileLoggedIn({
    required this.isAuth,
    required this.id,
    required this.email,
    required this.name,
  });

  factory ProfileLoggedIn.fromJson(Map<String, dynamic> json) {
    return ProfileLoggedIn(
      isAuth: json['isAuth'],
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }
}
