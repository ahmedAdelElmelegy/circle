import 'package:circle/data/models/body/contact_us_request_body.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/init_model.dart';
import 'package:circle/data/repository/contact_us_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUsProvider with ChangeNotifier {
  final nameFormKey = GlobalKey<FormState>();
  final subjectKey = GlobalKey<FormState>();
  final messageFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isFailure = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  InitModel? initModel;
  final ContactUsRepo contactUsRepo;
  ContactUsProvider(this.contactUsRepo);
  Future<ApiResponse> contactUs(ContactUsRequestBody contactBody) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await contactUsRepo.contactUs(contactBody);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      initModel = InitModel.fromJson(apiResponse.response!.data);
      if (initModel!.code == 200) {
        Fluttertoast.showToast(msg: 'contact_us_successfully'.tr());
        nameController.clear();
        subjectController.clear();
        messageController.clear();
        phoneController.clear();
        emailController.clear();
        isLoading = false;
        notifyListeners();
      } else if (initModel!.code == 422) {
        Fluttertoast.showToast(msg: apiResponse.response!.data['message']);
      }
    } else {
      isFailure = true;
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
