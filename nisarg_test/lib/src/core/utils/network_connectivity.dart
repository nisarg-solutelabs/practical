import 'package:connectivity_plus/connectivity_plus.dart';

///NetworkConnectivityChecker
abstract class NetworkConnectivityChecker {
  ///isNetworkAvailable
  Future<bool> isNetworkAvailable();

  ///validateNetworkConnectivity
  Future<void> validateNetworkConnectivity();
}

final NetworkConnectivityChecker _instance =
    NetworkConnectivity(Connectivity());

///networkConnectivityChecker
NetworkConnectivityChecker networkConnectivityChecker() => _instance;

///NetworkConnectivity
class NetworkConnectivity implements NetworkConnectivityChecker {
  ///init
  NetworkConnectivity(this.connectivity);

  ///connectivity
  Connectivity connectivity;

  @override
  Future<bool> isNetworkAvailable() async {
    final ConnectivityResult result = await connectivity.checkConnectivity();

    return _isNetworkAvailable(result);
  }

  @override
  Future<void> validateNetworkConnectivity() async {
    final ConnectivityResult result = await connectivity.checkConnectivity();

    if (!_isNetworkAvailable(result)) {
      throw NoNetworkException();
    }
  }

  bool _isNetworkAvailable(ConnectivityResult result) => <ConnectivityResult>[
        ConnectivityResult.mobile,
        ConnectivityResult.wifi,
      ].contains(result);
}

///NoNetworkException
class NoNetworkException implements Exception {}
