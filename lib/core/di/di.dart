import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:newsouq/core/api/dio_factory.dart';
import 'package:newsouq/features/home/data/apis/home_api_service.dart';
import 'package:newsouq/features/home/data/apis/new_home_api_service.dart';
import 'package:newsouq/features/home/data/repos/home_repo_imp.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/login/data/apis/login_api_service.dart';
import 'package:newsouq/features/login/data/repos/login_repo_imp.dart';
import 'package:newsouq/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq/features/reset_password/data/reset_password_repo_imp.dart';
import 'package:newsouq/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:newsouq/features/search/data/apis/search_api_service.dart';
import 'package:newsouq/features/search/data/repos/search_repo_imp.dart';
import 'package:newsouq/features/search/presentation/cubit/search_cubit.dart';
import 'package:newsouq/features/signup/data/apis/signup_api_service.dart';
import 'package:newsouq/features/signup/data/repos/signup_repo_imp.dart';
import 'package:newsouq/features/signup/presentation/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Database
  //getIt.registerLazySingleton<Database>(() => Database());

  // Dio
  Dio dio = DioFactory.getDio();

  // Signup
  getIt.registerLazySingleton<SignupApiService>(
    () => SignupApiService(auth: getIt<FirebaseAuth>()),
  );
  getIt.registerLazySingleton<SignupRepoImp>(
    () => SignupRepoImp(signupApiService: getIt<SignupApiService>()),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(signupRepoImp: getIt<SignupRepoImp>()),
  );

  // Login
  getIt.registerLazySingleton<LoginApiService>(
    () => LoginApiService(auth: getIt<FirebaseAuth>()),
  );
  getIt.registerLazySingleton<LoginRepoImp>(
    () => LoginRepoImp(loginApiService: getIt<LoginApiService>()),
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

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<NewHomeApiService>(() => NewHomeApiService());
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(
      homeApiService: getIt<HomeApiService>(),
      newHomeApiService: getIt<NewHomeApiService>(),
    ),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(homeRepoImp: getIt<HomeRepoImp>()),
  );

  // search
  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));
  getIt.registerLazySingleton<SearchRepoImp>(
    () => SearchRepoImp(searchApiService: getIt<SearchApiService>()),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(searchRepoImp: getIt<SearchRepoImp>()),
  );
}
