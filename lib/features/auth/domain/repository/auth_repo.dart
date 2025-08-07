import 'package:dartz/dartz.dart';
import 'package:dating_app/features/auth/data/model/user_creation_req.dart';
import 'package:dating_app/features/auth/data/model/user_signin_req.dart';

abstract class AuthRepo {
  Future<Either> signUp(UserCreationReq userCreationReq);
  Future<Either> signIn(UserSigninReq userSigninReq);
}
