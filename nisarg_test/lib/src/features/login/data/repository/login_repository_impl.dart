import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nisarg_test/src/core/response.dart';
import 'package:nisarg_test/src/core/utils/network_connectivity.dart';
import 'package:nisarg_test/src/features/login/data/datasources/remote_datasource.dart';
import 'package:nisarg_test/src/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  ///CategoryRepositoryImpl
  LoginRepositoryImpl(
    this._remoteDataSourceImpl,
  );
  late final RemoteDataSourceImpl _remoteDataSourceImpl;

  @override
  Future<Result<dynamic>> login({
    required String url,
    required String userName,
    required String password,
  }) async {
    if (await NetworkConnectivity(Connectivity()).isNetworkAvailable()) {
      final Result<dynamic> result = await _remoteDataSourceImpl.login(
        password: password,
        url: url,
        userName: userName,
      );
      return result;
    } else {
      return Result<dynamic>(
        message: 'No Intenet',
        isSuccess: false,
      );
    }
  }
}
