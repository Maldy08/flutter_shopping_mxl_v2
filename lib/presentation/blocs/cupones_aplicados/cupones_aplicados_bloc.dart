import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../infrastructure/models/cupones_aplicados.dart';
import '../../../infrastructure/repositories/firebase_cupones_aplicados_repository_impl.dart';

part 'cupones_aplicados_event.dart';
part 'cupones_aplicados_state.dart';

class CuponesAplicadosBloc
    extends Bloc<CuponesAplicadosEvent, CuponesAplicadosState> {
  final FirebaseCuponesAplicadosRepositoryImpl
      _firebaseCuponesAplicadosRepositoryImpl;

  CuponesAplicadosBloc(
      {FirebaseCuponesAplicadosRepositoryImpl?
          firebaseCuponesAplicadosRepositoryImpl})
      : _firebaseCuponesAplicadosRepositoryImpl =
            firebaseCuponesAplicadosRepositoryImpl ??
                FirebaseCuponesAplicadosRepositoryImpl(),
        super(const CuponesAplicadosState()) {
    on<CuponesAplicadosFetched>(_fetchCuponesAplicados);
    on<CuponesAplicadosSave>(_saveCupon);
  }

  Future<void> _fetchCuponesAplicados(CuponesAplicadosFetched event,
      Emitter<CuponesAplicadosState> emit) async {
    emit(state.copyWith(status: CuponesAplicadosStatus.fetching));

    final cuponesAplicados = await _firebaseCuponesAplicadosRepositoryImpl
        .getCuponesAplicados(idUsuario: event.idUsuario);
    emit(state.copyWith(
      cuponesAplicados: cuponesAplicados,
      status: CuponesAplicadosStatus.completed,
    ));
  }

  Future<void> _saveCupon(
      CuponesAplicadosSave event, Emitter<CuponesAplicadosState> emit) async {
    emit(state.copyWith(status: CuponesAplicadosStatus.apliying));
    await Future.delayed(const Duration(seconds: 5));
    await _firebaseCuponesAplicadosRepositoryImpl.aplicarCupon(
        idCupon: event.idCupon,
        idNegocio: event.idNegocio,
        idUsuario: event.idUsuario,
        vigencia: event.vigencia);
    final cuponesAplicados = await _firebaseCuponesAplicadosRepositoryImpl
        .getCuponesAplicados(idUsuario: event.idUsuario);
    emit(state.copyWith(
      cuponesAplicados: cuponesAplicados,
      status: CuponesAplicadosStatus.applied,
    ));
  }
}
