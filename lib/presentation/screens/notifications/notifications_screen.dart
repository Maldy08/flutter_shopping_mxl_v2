import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class NotificationsScreen extends StatelessWidget {
  static const String name = "notifications_screen";
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Notificaciones'),
      body: Placeholder(),
    );
  }
}
