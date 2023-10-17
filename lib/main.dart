import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:olearistest/core/style/colors/colors.dart';
import 'package:olearistest/router/router.dart';

import 'app_config.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InjectionContainer().init();

  sl<AppConfig>();
  runApp(
    Builder(builder: (context) {
      return EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const ClrThemeWidget(
          isDarkTheme: false,
          child: MyApp(),
        ),
      );
    }),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    if (Platform.isAndroid) {
      FlutterAppBadger.removeBadge();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: appRouter.config(),
    );
  }
}
