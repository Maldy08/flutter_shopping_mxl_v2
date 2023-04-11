import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';

part 'negocios_event.dart';
part 'negocios_state.dart';

class NegociosBloc extends Bloc<NegociosEvent, NegociosState> {
  NegociosBloc() : super(const NegociosState()) {
    on<NegociosEvent>((event, emit) {});
  }
}
