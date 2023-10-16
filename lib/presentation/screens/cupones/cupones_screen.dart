import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/cupones/cupones_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/negocios/negocios_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/cupones/widgets/cupones_details.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/cupones/widgets/cupones_sliver_appbar.dart';

class CuponesScreen extends StatefulWidget {
  final String id;
  static const String name = "cupon_screen";
  const CuponesScreen({super.key, required this.id});

  @override
  State<CuponesScreen> createState() => _CuponesScreenState();
}

class _CuponesScreenState extends State<CuponesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CuponesBloc>().add(CuponesFetchedById(widget.id));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final negocio = context.watch<NegociosBloc>().state.negocio;
    final cupon = context.watch<CuponesBloc>().state.cupon;
    const fontFamily = "Poppins";

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CuponesSliverAppBar(cupon: cupon),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => CuponesDetails(
                    cupon: cupon, negocio: negocio, fontFamily: fontFamily),
                childCount: 1),
          )
        ],
      ),
    );
  }
}
