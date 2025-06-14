import 'package:ekub_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ekub_application/features/home_page/data/data_source/home_remote_data_source.dart';
import 'package:ekub_application/features/home_page/data/repository/home_repository_implm.dart';
import 'package:ekub_application/features/home_page/domain/usecases/home_%20equb_loading.dart';
import 'package:ekub_application/features/home_page/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'features/auth/data/repository/auth_repository_implm.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/user_signin.dart';
import 'features/auth/domain/usecases/user_signup.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _intiAuth();
}

void _intiAuth() {
  serviceLocator
      .registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImplm());

  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImplm(serviceLocator()));

  serviceLocator.registerFactory(() => UserLogin(serviceLocator()));

  serviceLocator.registerFactory(() => UserSignup(serviceLocator()));

  serviceLocator.registerLazySingleton(() =>
      AuthBloc(userSignup: serviceLocator(), userLogin: serviceLocator()));

  //home page initialization

  serviceLocator.registerFactory<HomeRemoteDataResource>(
    () => HomeRemoteDataResourceImplm(),
  );
  serviceLocator.registerFactory(
    () => HomeRepositoryImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomeEqubLoading(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomeBloc(
      homeEqubLoading: serviceLocator(),
    ),
  );
}
