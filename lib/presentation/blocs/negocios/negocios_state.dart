part of 'negocios_bloc.dart';

enum NegociosStatus {
  loading,
  completed,
}

class NegociosState extends Equatable {
  final NegociosStatus negociosStatus;
//  final List<Negocios> negocios;

  const NegociosState({this.negociosStatus = NegociosStatus.loading});
  @override
  List<Object> get props => [];
}
