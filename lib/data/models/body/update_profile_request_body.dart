import 'dart:io';

class UpdateProfileRequestBody {
  final String firstName;
  final String lastName;
  File? image;

  UpdateProfileRequestBody(
      {required this.firstName, this.image, required this.lastName});
}
