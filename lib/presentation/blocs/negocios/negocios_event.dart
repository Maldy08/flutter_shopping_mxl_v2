part of 'negocios_bloc.dart';

class NegociosEvent extends Equatable {
  const NegociosEvent();

  @override
  List<Object> get props => [];
}

class NegociosFetched extends NegociosEvent {
  final List<Negocios> negocios;

  const NegociosFetched(this.negocios);

  @override
  List<Object> get props => [negocios];
}
