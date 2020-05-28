import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityManager extends ChangeNotifier {
  String connectivityString = 'Offline';

  Future checkNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      print('mobile');
      connectivityString = 'Mobile';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('wifi');
      connectivityString = 'Wi-Fi';
    } else {
      print('Offline');
      connectivityString = 'Offline';
    }
    notifyListeners();
  }

  Future updateConnection(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.mobile:
        connectivityString = 'Mobile';
        break;
      case ConnectivityResult.wifi:
        connectivityString = 'Wi-Fi';
        break;
      case ConnectivityResult.none:
        connectivityString = 'Offline';
        break;
      default:
        connectivityString = 'Offline';
    }
    notifyListeners();
  }
}
