import 'dart:io';

// import 'package:dio/dio.dart';

class UpdateProfileRequestBody {
  final String firstName;
  final String lastName;
  File? image;

  UpdateProfileRequestBody(
      {required this.firstName, this.image, required this.lastName});
  // FormData toFormData() {
  //   final Map<String, dynamic> data = {
  //     'name': firstName,
  //     'mobile': lastName,
  //   };

  //   if (image != null) {
  //     data['image'] = MultipartFile.fromFileSync(
  //       image!.path,
  //       filename: image!.path.split('/').last,
  //     );
  //   }

  //   return FormData.fromMap(data);
  // }
}
