import 'package:dio/dio.dart';
import 'package:nisarg_test/src/core/response.dart';

abstract class RemoteDataSource {
  Future<Result<dynamic>> login({
    required String url,
    required String userName,
    required String password,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<Result<dynamic>> login({
    required String url,
    required String userName,
    required String password,
  }) async {
    final dio = Dio();
    try {
      final response = await dio
          .post('http://demo.stapel.in/practical/login.php', queryParameters: {
        "username": userName,
        "password": password,
        "url": url,
        "multiple_user_login": {
          "device_token": "dMChrtBklsU:APA91bGv-",
          "device_type": "android",
          "dedevicevice_model": "Nokia 4.2",
          "_version": "10",
          "app_version": "2.0",
          "device_name": "Nokia",
          "device_uid": "f123447630d7c358"
        }
      });
      return Result(
        data: response,
      );
    } catch (e) {
      return Result(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }
}
