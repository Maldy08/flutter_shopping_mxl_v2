import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '/config/config.dart';
import '/presentation/blocs/blocs.dart';

class ConfigurationScreen extends StatelessWidget {
  static const String name = "configuration_screen";
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.watch<NotificationsBloc>().state.status;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        centerTitle: true,
      ),
      body: Container(
        color: bgContainer,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Switch(
                      value: status == AuthorizationStatus.authorized
                          ? true
                          : false,
                      onChanged: (value) {
                        context.read<NotificationsBloc>().add(
                            NotificationStatusChanged(value == true
                                ? AuthorizationStatus.authorized
                                : AuthorizationStatus.denied));
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Permitir Notificaciones'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
