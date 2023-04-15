import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/infrastructure.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';

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

  Future<void> _loadNegocio(
      LoadNegocio event, Emitter<NegociosState> emit) async {
    await Future.delayed(const Duration(seconds: 1));

    //final negocio = await _firebaseNegociosRepositoryImpl.getNegocioById(id: '1');
  }
}
