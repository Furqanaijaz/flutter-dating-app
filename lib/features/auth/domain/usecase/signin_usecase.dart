import 'package:dartz/dartz.dart';
import 'package:dating_app/core/usecase/usecase.dart';
import 'package:dating_app/features/auth/data/model/user_signin_req.dart';
import 'package:dating_app/features/auth/domain/repository/auth_repo.dart';
import 'package:dating_app/service_locator.dart';

class SigninUsecase implements Usecase<Either, UserSigninReq> {
  @override
  Future<Either> call(UserSigninReq? params) async {
    return await sl<AuthRepo>().signIn(params!);
  }
}
