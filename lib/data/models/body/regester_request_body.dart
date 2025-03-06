import 'dart:io';

class RegesterRequestBody {
  final String firstName;
  final String lastName;
  final String phoneCode = "+20";
  final String phone;
  final File? image;
  final String? invitationCode;
  final int cityId;

  RegesterRequestBody(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.image,
      required this.invitationCode,
      required this.cityId});

  Map<String, dynamic> tojson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_code': phoneCode,
      'phone': phone,
      'image': image,
      'invitation_code': invitationCode,
      'city_id': cityId,
    };
  }
}
