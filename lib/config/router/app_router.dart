import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_shopping_mxl_v2/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens.dart';

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
          final pageIndex = int.parse(state.params['page'] ?? '0');
          return HomeScreen(pageIndex: pageIndex);
        },
        redirect: (context, state) {
          final isGoingTo = state.subloc;
          if (bloc.state.status == AuthenticationStatus.authenticated) {
            if (isGoingTo == '/home/0' ||
                isGoingTo == '/home/1' ||
                isGoingTo == '/home/2' ||
                isGoingTo == '/home/3') return null;
          }
          return '/';
        },
        routes: const [],
      ),
      GoRoute(
        path: '/theme',
        name: ThemeChangerScreen.name,
        builder: (context, state) => const ThemeChangerScreen(),
      ),
    ],
    refreshListenable: bloc,
    redirect: (_, state) {
      final isGoingTo = state.subloc;
      if (bloc.state.status == AuthenticationStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/account-created' ||
            isGoingTo == '/') {
          return '/home/0';
        }
      }
      return null;

      //   return null;
    },
  );
}
