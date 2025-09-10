import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:newsouq/features/login/data/login_repo_imp.dart';
import 'package:newsouq/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq/features/signup/data/signup_repo_imp.dart';
import 'package:newsouq/features/signup/presentation/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<SignupRepoImp>(
    () => SignupRepoImp(auth: getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(signupRepoImp: getIt<SignupRepoImp>()),
  );

  getIt.registerLazySingleton<LoginRepoImp>(
    () => LoginRepoImp(auth: getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginRepoImp: getIt<LoginRepoImp>()),
  );
}
