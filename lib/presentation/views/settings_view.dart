import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/custom_elevated_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SettingsView();
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.watch<AuthenticationBloc>().state.user;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              //color: Colors.amber,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      child: user.photoUrl != null
                          ? ClipOval(
                              child: Image.network(
                                user.photoUrl!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.account_circle_rounded),
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.name!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.email!,
                    style: TextStyle(color: Colors.grey.shade500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      leading: IconButton(
                        iconSize: 20,
                        color: Colors.black45,
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                        style: AppTheme.iconButtonSettings(),
                      ),
                      title: const Text(
                        'Notificaciones',
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      leading: IconButton(
                        iconSize: 20,
                        color: Colors.black45,
                        onPressed: () {},
                        icon: const Icon(Icons.card_travel_rounded),
                        style: AppTheme.iconButtonSettings(),
                      ),
                      title: const Text(
                        'Terminos y condiciones',
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      leading: IconButton(
                        iconSize: 20,
                        color: Colors.black45,
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                        style: AppTheme.iconButtonSettings(),
                      ),
                      title: const Text(
                        'Cerrar sesión',
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(const LogoutRequested());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
