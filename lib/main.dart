import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/router/app_router.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
