import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:newsouq/features/login/data/login_repo_imp.dart';
import 'package:newsouq/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq/features/reset_password/data/reset_password_repo_imp.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:newsouq/features/signup/data/signup_repo_imp.dart';
import 'package:newsouq/features/signup/presentation/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Signup
  getIt.registerLazySingleton<SignupRepoImp>(
    () => SignupRepoImp(auth: getIt<FirebaseAuth>()),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(signupRepoImp: getIt<SignupRepoImp>()),
  );

  // Login
  getIt.registerLazySingleton<LoginRepoImp>(
    () => LoginRepoImp(auth: getIt<FirebaseAuth>()),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginRepoImp: getIt<LoginRepoImp>()),
  );

  // Reset Password
  getIt.registerLazySingleton<ResetPasswordRepoImp>(
    () => ResetPasswordRepoImp(auth: getIt<FirebaseAuth>()),
  );
  getIt.registerFactory<ResetPasswordCubit>(
    () =>
        ResetPasswordCubit(resetPasswordRepoImp: getIt<ResetPasswordRepoImp>()),
  );
}
