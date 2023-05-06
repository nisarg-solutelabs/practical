import 'package:nisarg_test/src/core/response.dart';

abstract class LoginRepository {
  Future<Result<dynamic>> login({
    required String url,
    required String userName,
    required String password,
  });
}
