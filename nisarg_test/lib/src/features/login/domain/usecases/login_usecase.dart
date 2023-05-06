import 'package:nisarg_test/src/core/response.dart';
import 'package:nisarg_test/src/features/login/data/repository/login_repository_impl.dart';

class LoginUsecase {
  ///initalization
  LoginUsecase(
    this._loginRepositoryImpl,
  );

  late final LoginRepositoryImpl _loginRepositoryImpl;

  ///it will return total image in dataset

  Future<Result<dynamic>> login({
    required String url,
    required String userName,
    required String password,
  }) =>
      _loginRepositoryImpl.login(
        password: password,
        url: url,
        userName: userName,
      );
}
