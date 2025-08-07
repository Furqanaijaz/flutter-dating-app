import 'package:dartz/dartz.dart';
import 'package:dating_app/core/usecase/usecase.dart';
import 'package:dating_app/features/auth/data/model/user_creation_req.dart';
import 'package:dating_app/features/auth/domain/repository/auth_repo.dart';
import 'package:dating_app/service_locator.dart';

class SignupUsescase implements Usecase<Either, UserCreationReq> {
  @override
  Future<Either> call(UserCreationReq? params) async {
    return await sl<AuthRepo>().signUp(params!);
  }
}
