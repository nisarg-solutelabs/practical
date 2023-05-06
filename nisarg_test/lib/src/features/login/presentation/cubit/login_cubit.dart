import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:nisarg_test/src/core/response.dart';
import 'package:nisarg_test/src/features/login/data/datasources/remote_datasource.dart';
import 'package:nisarg_test/src/features/login/data/repository/login_repository_impl.dart';
import 'package:nisarg_test/src/features/login/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    _loginUsecase = LoginUsecase(
      LoginRepositoryImpl(
        RemoteDataSourceImpl(),
      ),
    );
  }
  late LoginUsecase _loginUsecase;

  ///fetch stories
  Future<void>? login({
    required String url,
    required String userName,
    required String password,
  }) async {
    emit(LoginLoading());
    final Result<dynamic> response = await _loginUsecase.login(
      password: password,
      url: url,
      userName: userName,
    );
    if (!response.isSuccess) {
      emit(
        LoginException<dynamic>(
          error: response,
        ),
      );
    } else {
      emit(
        LoginLoaded(
          result: response,
        ),
      );
    }
  }
}
