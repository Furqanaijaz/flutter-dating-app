import 'package:dating_app/features/auth/data/repository/auth_repo_imple.dart';
import 'package:dating_app/features/auth/data/source/auth_source.dart';
import 'package:dating_app/features/auth/domain/repository/auth_repo.dart';
import 'package:dating_app/features/auth/domain/usecase/signin_usecase.dart';
import 'package:dating_app/features/auth/domain/usecase/signup_usescase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // source
  sl.registerSingleton<AuthSource>(AuthSourceImpl());
  // repository
  sl.registerSingleton<AuthRepo>(AuthRepoImple());

  //usecase
  sl.registerSingleton<SignupUsescase>(SignupUsescase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}
