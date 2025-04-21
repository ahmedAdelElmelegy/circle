import 'dart:io';

class SignupResponseBody {
  final String phoneCode = "+20";
  final String phone;
  int? inviteCode;

  final String firstName;
  final String lastName;
  final int cityId;
  File? image;

  SignupResponseBody(
      {required this.phone,
      this.inviteCode,
      this.image,
      required this.firstName,
      required this.lastName,
      required this.cityId});

  Map<String, dynamic> toJson() => {
        'invitation_code': inviteCode,
        'phone': phone,
        'phone_code': phoneCode,
        'first_name': firstName,
        'last_name': lastName,
        'city_id': cityId,
        'image': image
      };
}
