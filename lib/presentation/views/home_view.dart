import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/config.dart';
import '/infrastructure/models/models.dart';
import '/presentation/blocs/blocs.dart';
import '/presentation/widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  late User user;

  @override
  void initState() {
    super.initState();
    context.read<NegociosBloc>().add(NegociosFetched());
    context.read<ProductosBloc>().add(const ProductosFetchedAll());
    context.read<PromocionesBloc>().add(const PromocionesFetchAll());
    context.read<CuponesBloc>().add(const CuponesFetchAll());
    context.read<NotificationsBloc>().state.messageToken;
    final email = context.read<AuthenticationBloc>().state.user.email;
    context.read<FcmnotificationsBloc>().add(FCMnotificationsFetched(email!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // final scaffoldKey = GlobalKey<ScaffoldState>();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: _HomeView(theme: theme),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthenticationBloc>().state.user;

    final favoritos = context
        .watch<UserBloc>()
        .state
        .user
        .favoritesProducts
        .map((e) => e.idproducto)
        .toList();
    if (favoritos.isNotEmpty) {
      context.read<ProductosBloc>().add(FavoritosFetched(favoritos));
    }

    return const Column(
      children: [
        // Row(
        //   children: [
        //     const Spacer(),
        //     CircleAvatar(
        //       child: user.photoUrl != null
        //           ? ClipOval(
        //               child: Image.network(
        //                 user.photoUrl!,
        //                 fit: BoxFit.cover,
        //               ),
        //             )
        //           : IconButton(
        //               onPressed: () {},
        //               icon: const Icon(Icons.account_circle_rounded),
        //             ),
        //     )
        //   ],
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Row(
        //   children: [
        //     const Text(
        //       'Hola,',
        //       style: TextStyle(fontSize: 18),
        //     ),
        //     Text(
        //       "${user.name}.",
        //       style: TextStyle(fontSize: 18, color: theme.primaryColor),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: SizedBox(
        //         height: 50,
        //         child: OutlinedButton.icon(
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.search,
        //             color: Color(0xffB9C1CC),
        //           ),
        //           label: const Text(
        //             'Buscar Negocio o Producto',
        //             style: TextStyle(color: Color(0xffB9C1CC), fontSize: 16),
        //           ),
        //           style: AppTheme.outlinedButtonStyleAlignCenterLeft(),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        // FadeIn(child: const HomeSearchButtons()),
        SizedBox(height: 10),
        _Negocios(),
        // const SizedBox(height: 100),
      ],
    );
  }
}

class _Negocios extends StatelessWidget {
  const _Negocios();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        (AppBar().preferredSize.height - MediaQuery.of(context).padding.top) -
        150;

    return SizedBox(
      child: context.watch<NegociosBloc>().state.status ==
              NegociosStatus.fetching
          ? SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinPerfect(
                    infinite: true,
                    child: Icon(
                      Icons.refresh_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Cargando informacion...'),
                ],
              ),
            )
          : FadeIn(
              delay: const Duration(milliseconds: 200),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 2,
                          mainAxisExtent: 200,
                        ),
                        itemCount:
                            context.read<NegociosBloc>().state.negocios.length,
                        itemBuilder: (context, index) {
                          final negocio = context
                              .read<NegociosBloc>()
                              .state
                              .negocios[index];
                          return GestureDetector(
                            onTap: () {
                              context.push('/home/0/negocio/${negocio.id}');
                              // ScaffoldMessenger.of(context)
                              //     .hideCurrentSnackBar();
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text(negocio.id)));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: bgContainer,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: ImageLoading(
                                          photoUrl: negocio.photoUrl),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        maxLines: 2,
                                        softWrap: true,
                                        negocio.nombreEmpresa,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
