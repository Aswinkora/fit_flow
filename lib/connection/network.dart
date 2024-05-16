import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class Internet extends GetxController {
  Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(Netstatus);
  }

  void Netstatus(List<ConnectivityResult> cr) {
    if (cr.contains(ConnectivityResult.none)) {
      Get.rawSnackbar(
        title: 'NO Internet',
        message: 'Connect',
        isDismissible: false,
        duration: Duration(days: 1),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}