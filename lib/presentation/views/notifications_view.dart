import 'package:flutter/material.dart';
import '/presentation/widgets/widgets.dart';

class NotificationsView extends StatelessWidget {
  static const String name = "notifications_view";
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Notificaciones'),
      body: Placeholder(),
    );
  }
}
