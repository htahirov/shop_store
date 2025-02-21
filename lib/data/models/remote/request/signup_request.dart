class SignUpRequest {
  final String username;
  final String phoneNumber;
  final String email;
  final String password;
  final String passwordConfirm; 

  SignUpRequest({
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.passwordConfirm, 
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        username: json["username"],
        phoneNumber: json["mobile"],
        email: json["email"],
        password: json["password"],
        passwordConfirm: json["password_confirm"], 
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "mobile": phoneNumber,
        "email": email,
        "password": password,
        "password_confirm": passwordConfirm,
      };
}
