import 'package:auto_route/auto_route.dart';
import 'package:olearistest/features/auth/cubits/user_session_cubit/user_session_cubit.dart';
import 'package:olearistest/injection_container.dart';
import 'package:olearistest/router/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (sl<UserSessionCubit>().isUserAuthorized()) {
      resolver.next(true);
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}
