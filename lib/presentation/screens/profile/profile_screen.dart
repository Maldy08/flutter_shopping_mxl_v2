import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String name = "profile_screen";

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationBloc>().state.user;

    return Scaffold(
        appBar: const CustomAppBar(title: 'Perfil'),
        body: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipOval(
                      child: ImageLoading(
                        photoUrl: user.photoUrl ??
                            'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(user.email ?? ''),
                    Text(user.name ?? ''),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          onPressed: () {
                            Future<void> showAlertDialog() async {
                              return showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Eliminar mi cuenta'),
                                    content: const SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          Text(
                                              'Estas seguro que deseas eliminar tu cuenta ?'),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<AuthenticationBloc>()
                                                .add(const DeleteAcount());
                                          },
                                          child: const Text('Si')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('No'))
                                    ],
                                  );
                                },
                              );
                            }

                            showAlertDialog();
                          },
                          child: const Text(
                            'Eliminar mi cuenta',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )));
  }
}
