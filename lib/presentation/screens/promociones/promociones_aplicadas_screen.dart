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
    return BlocListener<PromocionesAplicadasBloc, PromocionesAplicadasState>(
        listener: (context, state) {
      if (state.status == PromocionesAplicadasStatus.fetching) {
        showModalBottomSheet(
            isDismissible: true,
            enableDrag: false,
            context: context,
            builder: (context) {
              return const SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text('Cargando ofertas aplicadas...'),
                    ),
                  ],
                ),
              );
            });
      } else {
        Navigator.of(context).pop();
      }
    }, child: BlocBuilder<PromocionesAplicadasBloc, PromocionesAplicadasState>(
      builder: (context, state) {
        return state.promocionesAplicadas.isEmpty
            ? const Scaffold(
                appBar: CustomAppBar(
                  title: 'Promociones aplicadas',
                ),
                body: Center(child: Text('No tienes promociones aplicadas')))
            : Scaffold(
                backgroundColor: Colors.white,
                appBar: const CustomAppBar(
                  title: 'Promociones aplicadas',
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                      child: ListView.builder(
                    itemCount: state.promocionesAplicadas.length,
                    itemBuilder: (context, index) {
                      final promocion = state.promocionesAplicadas[index];
                      final negocio = context
                          .read<NegociosBloc>()
                          .state
                          .negocios
                          .where((element) =>
                              element.id == promocion.idNegocio.toString())
                          .first;
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: Card(
                              color: bgContainer,
                              elevation: 0,
                              child: ListTile(
                                leading: ImageLoading(
                                  photoUrl: negocio.photoUrl,
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                ),
                                title: Text(promocion.nombreNegocio),
                                subtitle: Text(promocion.descripcion),
                                trailing: Text(promocion.vigencia),
                              )));
                    },
                  )),
                ),
              );
      },
    ));
  }
}
