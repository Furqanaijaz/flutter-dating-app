import 'package:dartz/dartz.dart';
import 'package:dating_app/features/auth/data/model/user_creation_req.dart';
import 'package:dating_app/features/auth/data/model/user_signin_req.dart';
import 'package:dating_app/features/auth/data/source/auth_source.dart';
import 'package:dating_app/features/auth/domain/repository/auth_repo.dart';
import 'package:dating_app/service_locator.dart';

class AuthRepoImple extends AuthRepo {
  @override
  Future<Either> signIn(UserSigninReq userSigninReq) async {
    return await sl<AuthSource>().signIn(userSigninReq);
  }

  @override
  Future<Either> signUp(UserCreationReq userCreationReq) async {
    return await sl<AuthSource>().signUp(userCreationReq);
  }
}
