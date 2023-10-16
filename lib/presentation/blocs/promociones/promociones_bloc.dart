import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/promociones.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/repositories/firebase_promociones_repository_impl.dart';

part 'promociones_event.dart';
part 'promociones_state.dart';

class PromocionesBloc extends Bloc<PromocionesEvent, PromocionesState> {
  final FirebasePromocionesRepositoryImpl _firebasePromocionesRepositoryImpl;

  PromocionesBloc(
      {FirebasePromocionesRepositoryImpl? firebasePromocionesRepositoryImpl})
      : _firebasePromocionesRepositoryImpl =
            firebasePromocionesRepositoryImpl ??
                FirebasePromocionesRepositoryImpl(),
        super(const PromocionesState()) {
    //
    on<PromocionesFetched>(_fetchPromociones);
    on<PromocionesFetchedById>(_fetchPromocionById);
    on<PromocionesFetchAll>(_fetchAllPromociones);
  }

  Future<void> _fetchPromociones(
      PromocionesFetched event, Emitter<PromocionesState> emit) async {
    emit(state.copyWith(status: PromocionesStatus.fetching));
    final promociones =
        await _firebasePromocionesRepositoryImpl.getPromociones(uid: event.uid);
    emit(state.copyWith(
        promocionesByNegocio: promociones,
        status: PromocionesStatus.completed));
  }

  Future<void> _fetchPromocionById(
      PromocionesFetchedById event, Emitter<PromocionesState> emit) async {
    emit(state.copyWith(status: PromocionesStatus.fetching));
    final promocion =
        state.promociones.where((element) => element.id == event.id);
    if (promocion.isEmpty) return;
    emit(state.copyWith(
        status: PromocionesStatus.completed, promocion: promocion.first));
  }

  Future<void> _fetchAllPromociones(
      PromocionesFetchAll event, Emitter<PromocionesState> emit) async {
    emit(state.copyWith(status: PromocionesStatus.fetching));
    final promociones =
        await _firebasePromocionesRepositoryImpl.getAllPromociones();
    emit(state.copyWith(
        promociones: promociones, status: PromocionesStatus.completed));
  }
}
