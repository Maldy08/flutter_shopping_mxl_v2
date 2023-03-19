import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/local_notifications/local_notifications.dart';
import 'package:flutter_shopping_mxl_v2/config/router/app_router.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/notifications/notifications_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => NotificationsBloc(
            requestLocalNotificationPermissions:
                LocalNotifications.requestPermissionLocalNotifications,
            showLocalNotification: LocalNotifications.showLocalNotification))
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
