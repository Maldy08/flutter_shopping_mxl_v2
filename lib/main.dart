import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'config/config.dart';
import 'infrastructure/infrastructure.dart';
import 'presentation/blocs/blocs.dart';

final firebaseRepository = FirebaseAuthRepositoryImpl();
final firebaseNegociosRepository = FirebaseNegociosRepositoryImpl();
final firebaseProductosRepository = FirebaseProductosRepositoryImpl();
final firebaseUserRepository = FirebaseUserRepositoryImpl();
final firebasePromocionesRepository = FirebasePromocionesRepositoryImpl();
final firebaseCuponesRepository = FirebaseCuponesRepositoryImpl();
final firebaseFCMtokensRepository = FirebaseFCMtokensRepositoryImpl();
final firebaseFCMnotificationsRepository =
    FirebaseFCMnotificationsRepositoryImpl();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  //await Future.delayed(const Duration(seconds: 2));
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();
  await LocalNotifications.initializeLocalNotifications();

  //final firebaseDatasource = FirebaseAuthDatasource();

  //await firebaseRepository.user.first;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FcmnotificationsBloc(
              firebaseFCMnotificationsRepositoryImpl:
                  firebaseFCMnotificationsRepository),
        ),
        BlocProvider(
          create: (BuildContext context) => NotificationsBloc(
              requestLocalNotificationPermissions:
                  LocalNotifications.requestPermissionLocalNotifications,
              showLocalNotification: LocalNotifications.showLocalNotification,
              fcMtokensRepositoryImpl: firebaseFCMtokensRepository,
              fcmnotificationsBloc: context.read<FcmnotificationsBloc>()),
        ),
        BlocProvider(
          create: (_) =>
              AuthenticationBloc(authenticationRepository: firebaseRepository),
        ),
        // BlocProvider(
        //   create: (_) => SharedPreferencesBloc(),
        // ),
        BlocProvider(
          create: (_) => LoginCubit(),
        ),
        BlocProvider(
          create: (_) => RegisterCubit(),
        ),
        BlocProvider(
          create: (_) => NegociosBloc(
              firebaseNegociosRepositoryImpl: firebaseNegociosRepository),
        ),
        BlocProvider(
          create: (_) => ProductosBloc(
              firebaseProductosRepositoryImpl: firebaseProductosRepository),
        ),
        BlocProvider(
          create: (_) => PromocionesBloc(
              firebasePromocionesRepositoryImpl: firebasePromocionesRepository),
        ),
        BlocProvider(
          create: (_) => CuponesBloc(
              firebaseCuponesRepositoryImpl: firebaseCuponesRepository),
        ),
        BlocProvider(
          create: (_) =>
              UserBloc(firebaseUserRepositoryImpl: firebaseUserRepository),
        ),

        // BlocProvider(
        //   create: (_) => FavoritesBloc(),
        // )
      ],
      child: MainApp(
        bloc: AuthenticationBloc(authenticationRepository: firebaseRepository),
      ),
    ),
  );

  final StreamSubscription<InternetConnectionStatus> listener =
      InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          // ignore: avoid_print
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          // ignore: avoid_print
          print('You are disconnected from the internet.');
          break;
      }
    },
  );

  // close listener after 30 seconds, so the program doesn't run forever
  await Future<void>.delayed(const Duration(seconds: 30));
  await listener.cancel();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.bloc});
  final AuthenticationBloc bloc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes(
          AuthenticationBloc(authenticationRepository: firebaseRepository)),
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
