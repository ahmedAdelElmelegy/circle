class LoginResponseBody {
  final phoneCode = "+20";
  final String phone;
  LoginResponseBody(this.phone);
  Map<String, dynamic> toJson() => {'phone': phone, 'phone_code': phoneCode};
}
