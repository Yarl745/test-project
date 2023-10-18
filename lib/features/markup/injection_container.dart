import 'package:dio/dio.dart';
import 'package:olearistest/features/markup/cubits/markup_generator_cubit/markup_generator_cubit.dart';
import 'package:olearistest/features/markup/data/repositories/markup_repository_impl.dart';
import 'package:olearistest/features/markup/domain/repositories/markup_repository.dart';
import 'package:olearistest/injection_container.dart';

mixin MarkupInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    final dio = sl<Dio>(instanceName: globalDio);

    // data sources

    // repositories
    sl.registerLazySingleton<MarkupRepository>(
      () => MarkupRepositoryImpl(),
    );

    // cubits
    sl.registerLazySingleton<MarkupGeneratorCubit>(
      () => MarkupGeneratorCubit(markupRepository: sl()),
    );
  }
}
