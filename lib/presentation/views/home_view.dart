import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
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
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderAfiliados(),
          _Negocios(),
          // const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _Negocios extends StatelessWidget {
  const _Negocios();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: context.watch<NegociosBloc>().state.status ==
              NegociosStatus.fetching
          ? Container(
              color: Theme.of(context).primaryColor,
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinPerfect(
                    infinite: true,
                    child: const Icon(
                      Icons.refresh_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cargando informacion...',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          : FadeIn(
              delay: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
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
                            mainAxisExtent: 200,
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
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: ImageLoading(
                                      photoUrl: negocio.photoUrl,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    negocio.nombreEmpresa,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
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
