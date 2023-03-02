import '/comman/utils.dart';
import '/core/app_constants.dart';
import '/comman/utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheck {
  Future<bool> checkInternet(context) async {
    bool _checkConnection = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _checkConnection = false;
      DialogBox().errorMsgDialog(context, AppConstants.internetError);
    } else if (connectivityResult == ConnectivityResult.mobile) {
      _checkConnection = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      _checkConnection = true;
    } else {
      _checkConnection = true;
    }
    return _checkConnection;
  }

  Future<bool> checkInternetWithoutPopup(context) async {
    bool _checkConnection = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _checkConnection = false;
    } else if (connectivityResult == ConnectivityResult.mobile) {
      _checkConnection = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      _checkConnection = true;
    } else {
      _checkConnection = true;
    }
    return _checkConnection;
  }
}
