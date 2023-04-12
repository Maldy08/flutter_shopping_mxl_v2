import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/negocios/negocios_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

import '../screens/home/widgets/home_search_buttons.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    //context.read<AuthenticationBloc>().onUserChange();
  }

  @override
  Widget build(BuildContext context) {
    // final scaffoldKey = GlobalKey<ScaffoldState>();
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: _HomeView(theme: theme),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthenticationBloc>().state.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Spacer(),
            CircleAvatar(
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
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Hola,',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "${user.name}.",
              style: TextStyle(fontSize: 18, color: theme.primaryColor),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xffB9C1CC),
                  ),
                  label: const Text(
                    'Buscar Negocio o Producto',
                    style: TextStyle(color: Color(0xffB9C1CC), fontSize: 16),
                  ),
                  style: AppTheme.outlinedButtonStyleAlignCenterLeft(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const HomeSearchButtons(),
        const SizedBox(height: 20),
        CustomElevatedButton(
          label: 'fetch',
          func: () {
            context.read<NegociosBloc>().add(NegociosFetched());
          },
        ),
      ],
    );
  }
}
