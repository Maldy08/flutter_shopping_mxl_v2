import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class PromocionesAplicadasScreen extends StatefulWidget {
  static const String name = "promociones_aplicadas_screen";
  const PromocionesAplicadasScreen({super.key});

  @override
  State<PromocionesAplicadasScreen> createState() =>
      _PromocionesAplicadasScreenState();
}

class _PromocionesAplicadasScreenState
    extends State<PromocionesAplicadasScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PromocionesAplicadasBloc>().add(
        PromocionesAplicadasFetched(context.read<UserBloc>().state.user.email));
  }

  @override
  Widget build(BuildContext context) {
    return context
            .read<PromocionesAplicadasBloc>()
            .state
            .promocionesAplicadas
            .isEmpty
        ? const Scaffold(
            appBar: CustomAppBar(
              title: 'Ofertas aplicadas',
            ),
            body: Center(child: Text('No tienes ofertas aplicadas')))
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomAppBar(
              title: 'Ofertas aplicadas',
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(child: BlocBuilder<PromocionesAplicadasBloc,
                  PromocionesAplicadasState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.promocionesAplicadas.length,
                    itemBuilder: (context, index) {
                      if (state.promocionesAplicadas.isEmpty) {
                        return const Center(
                            child: Text('No tienes ofertas aplicadas'));
                      }
                      final promocion = state.promocionesAplicadas[index];
                      final neg = context
                          .read<NegociosBloc>()
                          .state
                          .negocios
                          .where((element) =>
                              element.id == promocion.idNegocio.toString())
                          .first
                          .photoUrl;

                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: Card(
                              color: bgContainer,
                              elevation: 0,
                              child: ListTile(
                                leading: ImageLoading(
                                  photoUrl: neg,
                                  width: 100,
                                  height: 100,
                                ),
                                title: Text(promocion.nombreNegocio),
                                subtitle: Text(promocion.descripcion,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12)),
                                trailing: Text(
                                    promocion.fechaAplicada.substring(0, 10)),
                              )));
                    },
                  );
                },
              )),
            ));
  }
}
