import 'package:flutter/widgets.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [HomeScreen.page()];
    case AuthenticationStatus.notauthenticated:
      return [WelcomeScreen.page()];
  }
}
