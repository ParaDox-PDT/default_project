class LoginModel{
  final String email;
  final String password;

  LoginModel( {required this.email,required this.password});

  LoginModel copyWith({
    String? email,
    String? password,
    bool? isLogin,
  }) {
    return LoginModel(
        email: email ?? this.email,
        password: password ?? this.password);
  }

}