import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<NegociosBloc>().add(const NegociosFetched());
    context.read<ProductosBloc>().add(const ProductosFetchedAll());
    context.read<PromocionesBloc>().add(const PromocionesFetchAll());
    context.read<CuponesBloc>().add(const CuponesFetchAll());
    context.read<NotificationsBloc>().state.messageToken;
    final email = context.read<AuthenticationBloc>().state.user.email;
    context
        .read<FcmnotificationsBloc>()
        .add(FCMnotificationsFetched(email ?? 'pruebas@google.com'));
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
    return _HomeView(theme: theme);
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
    // final favoritos = context
    //     .watch<UserBloc>()
    //     .state
    //     .user
    //     .favoritesProducts
    //     .map((e) => e.idproducto)
    //     .toList();
    // if (favoritos.isNotEmpty) {
    //   context.read<ProductosBloc>().add(FavoritosFetched(favoritos));
    // }

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
        SizedBox(
          height: 10,
        ),
        Text(
          'AFILIADOS',
          style: TextStyle(fontSize: 16, backgroundColor: bgContainer),
        ),
        SizedBox(
          height: 20,
        ),
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
    final height = MediaQuery.of(context).size.height * 0.70;

    return Container(
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
                  children: [
                    SizedBox(
                      height: height,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          // await Future.delayed(const Duration(seconds: 2));
                          context
                              .read<NegociosBloc>()
                              .add(const NegociosFetched());
                          context
                              .read<ProductosBloc>()
                              .add(const ProductosFetchedAll());
                          context
                              .read<PromocionesBloc>()
                              .add(const PromocionesFetchAll());
                          context
                              .read<CuponesBloc>()
                              .add(const CuponesFetchAll());
                        },
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            mainAxisExtent: 170,
                          ),
                          itemCount: context
                              .read<NegociosBloc>()
                              .state
                              .negocios
                              .length,
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: ImageLoading(
                                        photoUrl: negocio.photoUrl),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
