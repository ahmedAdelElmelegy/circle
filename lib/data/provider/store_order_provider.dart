import 'package:circle/core/di/injection.dart';
import 'package:circle/core/error/failure.dart';
import 'package:circle/data/models/body/store_order/store_order.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/store_order_model/store_order_model.dart';
import 'package:circle/data/provider/shared_prefrence_provider.dart';
import 'package:circle/data/repository/store_order_repo.dart';
import 'package:circle/features/pay_and_delevary/ui/widgets/show_sucess_send_order.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StoreOrderProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  ServerFailure? serverFailure;
  StoreOrderRepo storeOrderRepo;
  StoreOrderModel? storeOrderModel;
  SharedPrefrenceProvider shared = getIt();
  StoreOrderProvider(this.storeOrderRepo);

  Future<ApiResponse> storeOrder(
      StoreOrder storeOrder, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await storeOrderRepo.storeOrder(storeOrder);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      storeOrderModel = StoreOrderModel.fromJson(apiResponse.response!.data);
      if (storeOrderModel!.code == 200) {
        shared.clearCart();
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => const ShowSucessSendOrder());
      } else {
        Fluttertoast.showToast(msg: storeOrderModel!.message!);
      }
    } else {
      isFailure = true;
      serverFailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
