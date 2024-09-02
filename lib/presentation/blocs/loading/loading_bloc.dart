import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_shopping_mxl_v2/infrastructure/infrastructure.dart';
// import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/negocios/negocios_bloc.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc(
    final NegociosBloc negociosBloc,

    // FirebaseNegociosRepositoryImpl? firebaseNegociosRepositoryImpl,
    // FirebaseProductosRepositoryImpl? firebaseProductosRepositoryImpl,
    // FirebaseCuponesRepositoryImpl? firebaseCuponesRepositoryImpl,
    // FirebasePromocionesRepositoryImpl? firebasePromocionesRepositoryImpl,
    // NegociosBloc? negociosBloc,
    // ProductosBloc? productosBloc,
    // CuponesBloc? cuponesBloc,
    // PromocionesBloc? promocionesBloc,
  ) : super(LoadingInitial()) {
    on<SetLoading>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      // final result = await Future.wait([
      //   _firebaseNegociosRepositoryImpl.getNegocios(),
      //   _firebaseProductosRepositoryImpl.getAllProduct(),
      //   _firebaseCuponesRepositoryImpl.getAllCupones(),
      //   _firebasePromocionesRepositoryImpl.getAllPromociones(),
      // ]);

      // for (var i = 0; i < result.length; i++) {
      //   if (i == 0) {
      //     final negocios = result[i] as List<Negocios>;
      //     _negociosBloc.state.copyWith(
      //       negocios: negocios,
      //       status: NegociosStatus.completed,
      //     );
      //   }
      //   if (i == 1) {
      //     final productos = result[i] as List<Productos>;
      //     _productosBloc.state.copyWith(
      //       productos: productos,
      //       status: ProductosStatus.completed,
      //     );
      //   }
      //   if (i == 2) {
      //     final cupones = result[i] as List<Cupones>;
      //     _cuponesBloc.state.copyWith(
      //       cupones: cupones,
      //       status: CuponesStatus.completed,
      //     );
      //   }
      //   if (i == 3) {
      //     final promociones = result[i] as List<Promociones>;
      //     _promocionesBloc.state.copyWith(
      //       promociones: promociones,
      //       status: PromocionesStatus.completed,
      //     );
      //   }
      // }

      emit(state.copyWith(status: LoadingStatus.completed));
    });

    on<SetCompleted>((event, emit) {
      emit(state.copyWith(status: LoadingStatus.completed));
    });
  }
}
