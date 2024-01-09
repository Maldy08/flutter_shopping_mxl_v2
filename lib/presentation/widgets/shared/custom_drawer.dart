import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/presentation/blocs/blocs.dart';
import '/presentation/widgets/shared/image_loading.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final user = context.read<AuthenticationBloc>().state.user;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // context.read<AuthenticationBloc>().state.status ==
          //         AuthenticationStatus.authenticated
          //     ? UserAccountsDrawerHeader(
          //         currentAccountPicture: ClipOval(
          //             child: user.photoUrl != null
          //                 ? ImageLoading(
          //                     photoUrl: user.photoUrl!,
          //                   )
          //                 : Container()),
          //         accountName:
          //             user.name != null ? Text(user.name!) : const Text(''),
          //         accountEmail: Text(user.email!),
          //         decoration: BoxDecoration(color: color),
          //       )
          //     : Container(),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Aviso de Privacidad'),
            onTap: () {
              context.push('/home/3/aviso-privacidad');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              context.push('/home/3/configuration');
            },
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              context.read<AuthenticationBloc>().add(const LogoutRequested());
            },
          ),
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'EnOfferta APP',
            applicationVersion: '0.1.1',
            applicationLegalese: '© 2023 ShoppingMX',
            child: Text("Acerca de"),
          ),
        ],
      ),
    );
  }
}
