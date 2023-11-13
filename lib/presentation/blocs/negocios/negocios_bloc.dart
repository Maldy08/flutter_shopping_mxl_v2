import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/infrastructure/infrastructure.dart';
import '/infrastructure/models/negocios.dart';

part 'negocios_event.dart';
part 'negocios_state.dart';

class NegociosBloc extends Bloc<NegociosEvent, NegociosState> {
  final FirebaseNegociosRepositoryImpl _firebaseNegociosRepositoryImpl;

  NegociosBloc({FirebaseNegociosRepositoryImpl? firebaseNegociosRepositoryImpl})
      : _firebaseNegociosRepositoryImpl =
            firebaseNegociosRepositoryImpl ?? FirebaseNegociosRepositoryImpl(),
        super(const NegociosState()) {
    //on<NegociosEvent>((event, emit) {});
    on<NegociosFetched>(_fetchNegocios);
    on<NegocioFetchedById>(_fetchNegocioById);
  }

  Future<void> _fetchNegocios(
      NegociosFetched event, Emitter<NegociosState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    final negocios = await _firebaseNegociosRepositoryImpl.getNegocios();
    emit(state.copyWith(
      negocios: negocios,
      status: NegociosStatus.completed,
    ));
  }

  Future<void> _fetchNegocioById(
      NegocioFetchedById event, Emitter<NegociosState> emit) async {
    emit(state.copyWith(status: NegociosStatus.fetching));

    //verifico si en mi listado de negocios del estado lo tengo.
    final neg = state.negocios.where((element) => element.id == event.id);
    if (neg.isNotEmpty) {
      final negocio = neg.first;
      emit(state.copyWith(
        negocio: negocio,
        status: NegociosStatus.completed,
      ));

      return;
    }

    // si no, voy y lo busco en la base de datos.
    final negocio =
        await _firebaseNegociosRepositoryImpl.getNegocioById(id: event.id);
    emit(state.copyWith(
      negocio: negocio,
      status: NegociosStatus.completed,
    ));

    //final negocio = await _firebaseNegociosRepositoryImpl.getNegocioById(id: '1');
  }
}
