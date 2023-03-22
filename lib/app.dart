import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/routes/routes.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/authentication/authentication_bloc.dart';

class App extends StatelessWidget {
  final FirebaseAuthRepositoryImpl _firebaseAuthRepositoryImpl;

  const App(
      {super.key,
      required FirebaseAuthRepositoryImpl firebaseAuthRepositoryImpl})
      : _firebaseAuthRepositoryImpl = firebaseAuthRepositoryImpl;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _firebaseAuthRepositoryImpl,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _firebaseAuthRepositoryImpl,
        ),
        child: const _AppView(),
      ),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlowBuilder<AuthenticationStatus>(
        state: context.select((AuthenticationBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
