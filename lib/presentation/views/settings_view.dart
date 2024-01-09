import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:go_router/go_router.dart';

import '/config/config.dart';
import '/infrastructure/models/firebase/firebase_user.dart';
import '/presentation/blocs/authentication/authentication_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _SettingsView();
  }

  @override
  bool get wantKeepAlive => true;
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    final user = context.watch<AuthenticationBloc>().state.user;

    return _SettingsViewDetails(user: user);
  }
}

class _SettingsViewDetails extends StatelessWidget {
  const _SettingsViewDetails({
    required this.user,
  });

  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              //color: Colors.amber,
              // child: Column(
              //   children: [
              //     SizedBox(
              //       height: 100,
              //       width: 100,
              //       child: CircleAvatar(
              //         child: user.photoUrl != null
              //             ? ClipOval(
              //                 child: ImageLoading(photoUrl: user.photoUrl!))
              //             : IconButton(
              //                 onPressed: () {},
              //                 icon: const Icon(Icons.account_circle_rounded),
              //               ),
              //       ),
              //     ),
              //     const SizedBox(height: 10),
              //     Text(
              //       user.name ?? '',
              //       style: const TextStyle(
              //           fontSize: 18, fontWeight: FontWeight.bold),
              //     ),
              //     const SizedBox(height: 10),
              //     Text(
              //       user.email ?? '',
              //       style: TextStyle(color: Colors.grey.shade500),
              //     )
              //   ],
              // ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  // Card(
                  //   color: Colors.white,
                  //   elevation: 0,
                  //   child: ListTile(
                  //     trailing: IconButton(
                  //       icon: const Icon(Icons.arrow_forward_ios_rounded),
                  //       onPressed: () {
                  //         context.push('/home/3/notifications');
                  //       },
                  //     ),
                  //     leading: IconButton(
                  //       iconSize: 20,
                  //       color: Colors.white,
                  //       onPressed: () {
                  //         context.push('/home/3/notifications');
                  //       },
                  //       icon: const Icon(Icons.notifications),
                  //       style: AppTheme.iconButtonSettings(),
                  //     ),
                  //     title: const Text(
                  //       'Notificaciones',
                  //       style: TextStyle(fontSize: 14),
                  //     ),
                  //     // onTap: () => context.push('/home/3/notifications'),
                  //   ),
                  // ),
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),
                        onPressed: () {
                          context.push('/home/3/profile');
                        },
                      ),
                      leading: IconButton(
                        iconSize: 20,
                        color: Colors.white,
                        onPressed: () {
                          context.push('/home/3/profile');
                        },
                        icon: const Icon(LineariconsFree.user_1),
                        style: AppTheme.iconButtonSettings(),
                      ),
                      title: const Text(
                        'Perfil',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),
                        onPressed: () {
                          context.push('/home/3/favorites');
                        },
                      ),
                      leading: IconButton(
                        iconSize: 20,
                        color: Colors.white,
                        onPressed: () {
                          context.push('/home/3/favorites');
                        },
                        icon: const Icon(LineariconsFree.heart_1),
                        style: AppTheme.iconButtonSettings(),
                      ),
                      title: const Text(
                        'Favoritos',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),
                        onPressed: () {
                          context.push('/home/3/aviso-privacidad');
                        },
                      ),
                      leading: IconButton(
                        iconSize: 20,
                        color: Colors.white,
                        onPressed: () {
                          context.push('/home/3/aviso-privacidad');
                        },
                        icon: const Icon(LineariconsFree.warning),
                        style: AppTheme.iconButtonSettings(),
                      ),
                      title: const Text(
                        'Aviso de Privacidad',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),
                        onPressed: () {
                          context.push('/home/3/configuration');
                        },
                      ),
                      leading: IconButton(
                        iconSize: 20,
                        color: Colors.white,
                        onPressed: () {
                          context.push('/home/3/configuration');
                        },
                        icon: const Icon(Linecons.params),
                        style: AppTheme.iconButtonSettings(),
                      ),
                      title: const Text(
                        'Configuración',
                        style: TextStyle(fontSize: 14),
                      ),
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
                        color: Colors.white,
                        onPressed: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(const LogoutRequested());
                        },
                        icon: const Icon(Icons.logout),
                        style: AppTheme.iconButtonSettings(),
                      ),
                      title: const Text(
                        'Cerrar sesión',
                        style: TextStyle(fontSize: 14),
                      ),
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
