import 'package:dio/dio.dart';
import 'package:olearistest/features/auth/cubits/login_cubit/login_cubit.dart';
import 'package:olearistest/features/auth/cubits/user_session_cubit/user_session_cubit.dart';
import 'package:olearistest/features/auth/data/datasource/auth_cache_datasource.dart';
import 'package:olearistest/features/auth/data/datasource/auth_http_datasource.dart';
import 'package:olearistest/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:olearistest/features/auth/domain/repositories/auth_repository.dart';
import 'package:olearistest/injection_container.dart';

mixin AuthInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    final dio = sl<Dio>(instanceName: globalDio);

    // data sources
    sl
      ..registerLazySingleton<AuthHttpDatasource>(
        () => AuthHttpDatasourceImpl(dio: dio),
      )
      ..registerLazySingleton<AuthCacheDatasource>(
        () => const AuthCacheDatasourceImpl(),
      );

    // repositories
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authCacheDatasource: sl(),
        authHttpDatasource: sl(),
      ),
    );

    // cubits
    sl
      ..registerLazySingleton<LoginCubit>(
        () => LoginCubit(authRepository: sl()),
      )
      ..registerLazySingleton<UserSessionCubit>(
        () => UserSessionCubit(authRepository: sl()),
      );
  }
}
