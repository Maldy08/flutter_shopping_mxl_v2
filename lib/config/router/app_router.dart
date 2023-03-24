import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter routes(AuthenticationBloc bloc) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
          path: '/',
          name: WelcomeScreen.name,
          builder: (context, state) => const WelcomeScreen()),
      GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: RegisterScreen.name,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/account-created',
        name: AccountCreatedScreen.name,
        builder: (context, state) => const AccountCreatedScreen(),
      ),
      GoRoute(
        path: '/home/:page',
        name: HomeScreen.name,
        builder: (context, state) {
          //final status = context.watch<AuthenticationBloc>().state.status;
          final pageIndex = int.parse(state.params['page'] ?? '0');
          return HomeScreen(pageIndex: pageIndex);
        },
        routes: const [],
      ),
      GoRoute(
        path: '/theme',
        name: ThemeChangerScreen.name,
        builder: (context, state) => const ThemeChangerScreen(),
      ),
    ],
  );
}
