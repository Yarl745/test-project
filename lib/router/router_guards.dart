import 'package:auto_route/auto_route.dart';
import 'package:olearistest/router/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  static const isUserLoggedIn = false;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (isUserLoggedIn) {
      resolver.next(true);
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}
