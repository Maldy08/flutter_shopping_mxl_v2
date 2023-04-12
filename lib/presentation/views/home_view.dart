import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';

import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';

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
    context.read<NegociosBloc>().add(NegociosFetched());
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
        const SizedBox(height: 400, child: _Negocios()),
        // const SizedBox(height: 20),
      ],
    );
  }
}

class _Negocios extends StatelessWidget {
  const _Negocios();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: context.watch<NegociosBloc>().state.status ==
                NegociosStatus.fetching
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : SizedBox(
                height: 350,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200),
                        itemCount:
                            context.watch<NegociosBloc>().state.negocios.length,
                        itemBuilder: (context, index) {
                          final negocio = context
                              .watch<NegociosBloc>()
                              .state
                              .negocios[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red),
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    negocio.photoUrl,
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(negocio.nombreEmpresa)
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ));
  }
}


//context.read<NegociosBloc>().state.negocios.length,

// ListView.builder(
//                 itemCount: context.watch<NegociosBloc>().state.negocios.length,
//                 itemBuilder: (context, index) {
//                   final negocio =
//                       context.watch<NegociosBloc>().state.negocios[index];
//                   return Card(
//                     child: Text(negocio.nombreEmpresa),
//                   );
//                 },
//               ),



                  // alignment: Alignment.bottomCenter,
                  // decoration: BoxDecoration(
                  //     color: Colors.amber,
                  //     borderRadius: BorderRadius.circular(5)),
                  // child: Column(
                  //   children: [
                  //     Text(negocio.nombreEmpresa),
                  //     Text(negocio.nombreEmpresa)
                  //   ],
                  // ),


                      //                   Text(
                      //   negocio.nombreEmpresa,
                      //   textAlign: TextAlign.center,
                      //   style: const TextStyle(fontSize: 12),
                      // )


                  //                       child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(10),
                  //       child: negocio.photoUrl.isNotEmpty
                  //           ? Image.network(
                  //               negocio.photoUrl,
                  //               height: 100,
                  //               width: 100,
                  //               fit: BoxFit.fill,
                  //             )
                  //           : const Text('no imagen'),
                  //     ),
                  //   ],
                  // ),