import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/tour/tour_screen.dart';
import 'package:flutter_shopping_mxl_v2/presentation/shared_preferences_test.dart';
import 'package:flutter_shopping_mxl_v2/presentation/views/favorites/favorites_view.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/blocs.dart';
import '../../presentation/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final prefs = SharedPreferencesTest();

GoRouter routes(AuthenticationBloc bloc) {
  return GoRouter(
    initialLocation: '/login',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: WelcomeScreen.name,
        builder: (context, state) {
          return const WelcomeScreen();
        },
      ),
      GoRoute(
        path: '/tour',
        name: TourScreen.name,
        builder: (context, state) => TourScreen(),
      ),
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
                isGoingTo == '/home/3' ||
                isGoingTo == '/home/4') return null;
          }

          return '/login';
        },
        routes: [
          // GoRoute(
          //   path: 'notifications',
          //   name: NotificationsScreen.name,
          //   builder: (context, state) => const NotificationsScreen(),
          // ),
          GoRoute(
            path: 'aviso-privacidad',
            name: AvisoPrivacidadScreen.name,
            builder: (context, state) => const AvisoPrivacidadScreen(),
          ),
          GoRoute(
            path: 'configuration',
            name: ConfigurationScreen.name,
            builder: (context, state) => const ConfigurationScreen(),
          ),
          GoRoute(
            path: 'favorites',
            name: FavoritesView.name,
            builder: (context, state) => const FavoritesView(
              pageIndex: 0,
            ),
          ),
          GoRoute(
            path: 'profile',
            name: ProfileScreen.name,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: 'negocio/:id',
            name: NegocioScreen.name,
            builder: (context, state) {
              final id = state.params['id'] ?? '0 ';
              return NegocioScreen(id: id);
            },
          ),
          GoRoute(
            path: 'producto/:id',
            name: ProductoScreen.name,
            builder: (context, state) {
              final id = state.params['id'] ?? '0 ';
              // final uid = state.params['uid'] ?? '0';
              return ProductoScreen(
                id: id,
                // uid: uid,
              );
            },
          ),
          GoRoute(
            path: 'promocion/:id',
            name: PromocionesScreen.name,
            builder: (context, state) {
              final id = state.params['id'] ?? '0 ';
              // final uid = state.params['uid'] ?? '0';
              return PromocionesScreen(
                id: id,
                // uid: uid,
              );
            },
          ),
          GoRoute(
            path: 'cupon/:id',
            name: CuponesScreen.name,
            builder: (context, state) {
              final id = state.params['id'] ?? '0 ';
              // final uid = state.params['uid'] ?? '0';
              return CuponesScreen(
                id: id,
                // uid: uid,
              );
            },
          ),
        ],
      ),
    ],
    refreshListenable: bloc,
    redirect: (_, state) async {
      final isGoingTo = state.subloc;
      if (bloc.state.status == AuthenticationStatus.authenticated) {
        if (isGoingTo == '/login' ||
            //isGoingTo == '/register' ||
            //isGoingTo == '/account-created' ||
            isGoingTo == '/') {
          return '/home/0';
        } else if (isGoingTo == '/register') {
          return '/account-created';
        }
      } else {
        final firstTime = await prefs.getFirstTimeUse();
        if (firstTime) return '/tour';
      }

      return null;

      //   return null;
    },
  );
}
