import 'package:auto_route/auto_route.dart';
import 'package:olearistest/router/router.gr.dart';
import 'package:olearistest/router/router_guards.dart';

@RoutePage(name: 'MainAppRouter')
class MainAppRouterPage extends AutoRouter {
  const MainAppRouterPage({super.key});
}

@RoutePage(name: 'AuthRouter')
class AuthRouterPage extends AutoRouter {
  const AuthRouterPage({super.key});
}

/// Generate router code
/// dart run build_runner watch --delete-conflicting-outputs
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  // @override
  // RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: MainAppRouter.page,
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        AutoRoute(
          path: 'auth',
          page: AuthRouter.page,
          children: [
            AutoRoute(path: '', page: LoginRoute.page),
            // AutoRoute(path: 'sign-up', page: SignUpRoute.page),
          ],
        ),
        AutoRoute(
          path: 'home',
          page: HomeRoute.page,
          guards: [AuthGuard()],
        ),
      ],
    ),
  ];
}
