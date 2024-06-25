import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../infrastructure/models/promociones_aplicadas.dart';
import '../../../infrastructure/repositories/firebase_promociones_aplicadas_repository_impl.dart';

part 'promociones_aplicadas_event.dart';
part 'promociones_aplicadas_state.dart';

class PromocionesAplicadasBloc
    extends Bloc<PromocionesAplicadasEvent, PromocionesAplicadasState> {
  final FirebasePromocionesAplicadasRepositoryImpl
      _firebasePromocionesAplicadasRepositoryImpl;

  PromocionesAplicadasBloc(
      {FirebasePromocionesAplicadasRepositoryImpl?
          firebasePromocionesAplicadasRepositoryImpl})
      : _firebasePromocionesAplicadasRepositoryImpl =
            firebasePromocionesAplicadasRepositoryImpl ??
                FirebasePromocionesAplicadasRepositoryImpl(),
        super(const PromocionesAplicadasState()) {
    on<PromocionesAplicadasFetched>(_fetchPromocionesAplicadas);
    on<PromocionesAplicadasSave>(_savePromocion);
  }

  Future<void> _fetchPromocionesAplicadas(PromocionesAplicadasFetched event,
      Emitter<PromocionesAplicadasState> emit) async {
    emit(state.copyWith(status: PromocionesAplicadasStatus.fetching));

    //await Future.delayed(const Duration(seconds: 5));

    final promocionesAplicadas =
        await _firebasePromocionesAplicadasRepositoryImpl
            .getPromocionesAplicadas(idUsuario: event.idUsuario);
    emit(state.copyWith(
      promocionesAplicadas: promocionesAplicadas,
      status: PromocionesAplicadasStatus.completed,
    ));
  }

  Future<void> _savePromocion(PromocionesAplicadasSave event,
      Emitter<PromocionesAplicadasState> emit) async {
    emit(state.copyWith(status: PromocionesAplicadasStatus.apliying));
    await Future.delayed(const Duration(seconds: 5));
    await _firebasePromocionesAplicadasRepositoryImpl.aplicarPromocion(
        idPromocion: event.idPromocion,
        descripcion: event.descripcion,
        idNegocio: event.idNegocio,
        nombreNegocio: event.nombreNegocio,
        idUsuario: event.idUsuario,
        vigencia: event.vigencia);
    final promocionesAplicadas =
        await _firebasePromocionesAplicadasRepositoryImpl
            .getPromocionesAplicadas(idUsuario: event.idUsuario);
    emit(state.copyWith(
      promocionesAplicadas: promocionesAplicadas,
      status: PromocionesAplicadasStatus.applied,
    ));
  }
}
