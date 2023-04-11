import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'negocios_event.dart';
part 'negocios_state.dart';

class NegociosBloc extends Bloc<NegociosEvent, NegociosState> {
  NegociosBloc() : super(NegociosInitial()) {
    on<NegociosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
