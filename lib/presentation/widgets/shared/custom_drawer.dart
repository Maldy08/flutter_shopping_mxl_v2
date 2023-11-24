import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/image_loading.dart';
import 'package:go_router/go_router.dart';

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
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
              child: ImageLoading(
                photoUrl: user.photoUrl!,
              ),
            ),
            accountName: Text(user.name!),
            accountEmail: Text(user.email!),
            decoration: BoxDecoration(color: color),
          ),
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
        ],
      ),
    );
  }
}
