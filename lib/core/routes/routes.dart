import 'package:go_router/go_router.dart';
import 'package:softnet_school_portal/core/feature/auth/view/login_view.dart';
import 'package:softnet_school_portal/core/feature/main/view/main_view.dart';
import 'package:softnet_school_portal/core/feature/splash/view/splash_view.dart';
import 'package:softnet_school_portal/core/routes/routes_name.dart';
import 'package:softnet_school_portal/core/theme/view/theme_view.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      name: RouteName.splash,
      path: '/',
      builder: (context, state) => const SplashView()),
  GoRoute(
    name: RouteName.theme,
    path: '/theme',
    builder: ((context, state) => const ThemeView()),
  ),
  GoRoute(
    name: RouteName.login,
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    name: RouteName.main,
    path: '/main',
    builder: (context, state) => const MainView(),
  )
]);
