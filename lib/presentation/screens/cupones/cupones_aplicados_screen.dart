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
  }

  @override
  Widget build(BuildContext context) {
    return context.read<CuponesAplicadosBloc>().state.cuponesAplicados.isEmpty
        ? const Scaffold(
            appBar: CustomAppBar(
              title: 'Cupones aplicados',
            ),
            body: Center(child: Text('No tienes cupones aplicados')))
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomAppBar(
              title: 'Cupones aplicados',
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(child:
                  BlocBuilder<CuponesAplicadosBloc, CuponesAplicadosState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.cuponesAplicados.length,
                    itemBuilder: (context, index) {
                      final cupon = state.cuponesAplicados[index];
                      final neg = context
                          .read<NegociosBloc>()
                          .state
                          .negocios
                          .where((element) =>
                              element.id == cupon.idNegocio.toString())
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
                                title: Text(cupon.nombreNegocio),
                                subtitle: Text(cupon.descripcion),
                                trailing: Text(cupon.vigencia.substring(0, 10)),
                              )));
                    },
                  );
                },
              )),
            ));
  }
}
