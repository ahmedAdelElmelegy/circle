import 'package:circletraning/data/models/body/login_request_body.dart';
import 'package:circletraning/data/provider/regester_provider.dart';
import 'package:circletraning/data/repository/login_repo.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:circletraning/features/sign_up/ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../core/helpers/extentions.dart';
import '../models/response/auth_model/auth_model.dart';
import '../models/response/base/api_response.dart';
import '../repository/save_user_data.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepo loginRepo;
  final SaveUserData saveUserData;

  LoginProvider(
    this.loginRepo,
    this.saveUserData,
  );

  /// login TextEditingController
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ///variables
  bool _isLoading = false;
  AuthModel? _loginBody;

  ///getters
  bool get isLoading => _isLoading;
  AuthModel? get loginBody => _loginBody;

  ///calling APIs Functions
  Future<ApiResponse> login(LoginRequestBody body, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    var responseModel = await loginRepo.login(body);

    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _loginBody = AuthModel.fromJson(responseModel.response?.data);
      if (_loginBody != null && _loginBody?.code == 200) {
        if (_loginBody?.data?.user!.id != null) {
          saveUserData.saveUserData(_loginBody!);
          saveUserData.saveUserToken(_loginBody?.data?.auth?.token ?? '');
          phoneController.text = '';
          pushAndRemoveUntil(const MainScreen());
        }
      } else if (_loginBody?.code == 422) {
        Fluttertoast.showToast(msg: responseModel.response?.data['message']);
        // ignore: use_build_context_synchronously
        Provider.of<RegesterProvider>(context, listen: false).phoneController =
            phoneController;
        push(const SignUp(isCreated: true));
      }
    } else {
      _isLoading = false;
      Fluttertoast.showToast(msg: responseModel.error);
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
