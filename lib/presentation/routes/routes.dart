import 'package:go_router/go_router.dart';
import 'package:letto/presentation/pages/auth/login_page.dart';
import 'package:letto/presentation/pages/home_page.dart';

final routes = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);