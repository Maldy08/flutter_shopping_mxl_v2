import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_shopping_mxl_v2/config/config.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/infrastructure.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/repositories/firebase_user_repository_impl.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/favorites/favorites_bloc.dart';

final firebaseRepository = FirebaseAuthRepositoryImpl();
final firebaseNegociosRepository = FirebaseNegociosRepositoryImpl();
final firebaseUserRepository = FirebaseUserRepositoryImpl();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  //await Future.delayed(const Duration(seconds: 2));
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();
  await LocalNotifications.initializeLocalNotifications();

  //final firebaseDatasource = FirebaseAuthDatasource();

  //await firebaseRepository.user.first;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NotificationsBloc(
              requestLocalNotificationPermissions:
                  LocalNotifications.requestPermissionLocalNotifications,
              showLocalNotification: LocalNotifications.showLocalNotification),
        ),
        BlocProvider(
          create: (_) =>
              AuthenticationBloc(authenticationRepository: firebaseRepository),
        ),
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
          create: (_) =>
              UserBloc(firebaseUserRepositoryImpl: firebaseUserRepository),
        ),
        BlocProvider(
          create: (_) => FavoritesBloc(),
        )
      ],
      child: MainApp(
        bloc: AuthenticationBloc(authenticationRepository: firebaseRepository),
      ),
    ),
  );
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
