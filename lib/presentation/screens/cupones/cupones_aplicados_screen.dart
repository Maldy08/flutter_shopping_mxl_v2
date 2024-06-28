import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/config.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class CuponesAplicadosScreen extends StatefulWidget {
  static const String name = "cupones_aplicados_screen";
  const CuponesAplicadosScreen({super.key});

  @override
  State<CuponesAplicadosScreen> createState() => _CuponesAplicadosScreenState();
}

class _CuponesAplicadosScreenState extends State<CuponesAplicadosScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CuponesAplicadosBloc>().add(
        CuponesAplicadosFetched(context.read<UserBloc>().state.user.email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CuponesAplicadosBloc, CuponesAplicadosState>(
        listener: (context, state) {
      if (state.status == CuponesAplicadosStatus.fetching) {
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
                      Center(child: CircularProgressIndicator()),
                      SizedBox(height: 10),
                      Center(child: Text('Cargando cupones aplicados...')),
                    ],
                  ));
            });
      } else {
        Navigator.of(context).pop();
      }
    }, child: BlocBuilder<CuponesAplicadosBloc, CuponesAplicadosState>(
      builder: (context, state) {
        return state.cuponesAplicados.isEmpty
            ? const Scaffold(
                appBar: CustomAppBar(
                  title: 'Cupones aplicadas',
                ),
                body: Center(child: Text('No tienes cupones aplicados')))
            : Scaffold(
                backgroundColor: Colors.white,
                appBar: const CustomAppBar(
                  title: 'Cupones aplicados',
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                      child: ListView.builder(
                    itemCount: state.cuponesAplicados.length,
                    itemBuilder: (context, index) {
                      final promocion = state.cuponesAplicados[index];
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
