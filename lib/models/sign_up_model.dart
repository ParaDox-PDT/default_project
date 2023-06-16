class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,required this.confirmPassword, });

  SignUpModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword
  }) {
    return SignUpModel(
      confirmPassword: confirmPassword ?? this.confirmPassword,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  bool  checkPassword(String passWord){
    bool isUpper=false;
    bool isLower=false;
    bool isNum=false;
    for(int i=0;i<password.length;i++){
      if(password[i].codeUnits[0]>64 && password[i].codeUnits[0]<91) isUpper=true;
      if(password[i].codeUnits[0]>96 && password[i].codeUnits[0]<123) isLower=true;
      if(password[i].codeUnits[0]>47 && password[i].codeUnits[0]<58) isNum=true;
    }

    if(isUpper && isLower && isNum) return true;
    return false;
  }

  bool canSaveData(){
    if(confirmPassword!=password)return false;
    if(firstName.isEmpty)return false;
    if(lastName.isEmpty)return false;
    if(email.length<7 && !email.contains("@"))return false;
    if(!checkPassword(password))return false;
    return true;
  }
}
