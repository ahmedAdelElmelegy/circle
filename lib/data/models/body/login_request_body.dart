class LoginRequestBody {
  final String phoneCode = '+20';
  final String phone;

  LoginRequestBody({required this.phone});
  Map<String, dynamic> tojson() {
    return {
      'phone_code': phoneCode,
      'phone': phone,
    };
  }
}
