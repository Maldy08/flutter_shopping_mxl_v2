import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/infrastructure/models/cupones.dart';
import '/infrastructure/repositories/firebase_cupones_repository_impl.dart';

part 'cupones_event.dart';
part 'cupones_state.dart';

class CuponesBloc extends Bloc<CuponesEvent, CuponesState> {
  final FirebaseCuponesRepositoryImpl _firebaseCuponesRepositoryImpl;

  CuponesBloc({FirebaseCuponesRepositoryImpl? firebaseCuponesRepositoryImpl})
      : _firebaseCuponesRepositoryImpl =
            firebaseCuponesRepositoryImpl ?? FirebaseCuponesRepositoryImpl(),
        super(const CuponesState()) {
    on<CuponesFetched>(_fetchCupones);
    on<CuponesFetchedById>(_fecthCuponeById);
    on<CuponesFetchAll>(_fetchAllCupones);
  }

  Future<void> _fetchCupones(
      CuponesFetched event, Emitter<CuponesState> emit) async {
    emit(state.copyWith(status: CuponesStatus.fetching));
    final cupones =
        await _firebaseCuponesRepositoryImpl.getCupones(uid: event.uid);

    emit(state.copyWith(
        status: CuponesStatus.completed, cuponesByNegocio: cupones));
  }

  Future<void> _fecthCuponeById(
      CuponesFetchedById event, Emitter<CuponesState> emit) async {
    emit(state.copyWith(status: CuponesStatus.fetching));
    final cupon = state.cupones.where((element) => element.id == event.id);
    if (cupon.isEmpty) return;
    emit(state.copyWith(status: CuponesStatus.completed, cupon: cupon.first));
  }

  Future<void> _fetchAllCupones(
      CuponesFetchAll event, Emitter<CuponesState> emit) async {
    emit(state.copyWith(status: CuponesStatus.fetching));
    final cupones = await _firebaseCuponesRepositoryImpl.getAllCupones();

    emit(state.copyWith(status: CuponesStatus.completed, cupones: cupones));
  }
}
