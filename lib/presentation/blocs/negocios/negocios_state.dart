part of 'negocios_bloc.dart';

enum NegociosStatus {
  fetching,
  completed,
}

class NegociosState extends Equatable {
  final NegociosStatus status;
  final List<Negocios> negocios;

  const NegociosState({
    this.status = NegociosStatus.fetching,
    this.negocios = const [],
  });

  NegociosState copyWith({
    NegociosStatus? status,
    List<Negocios>? negocios,
  }) =>
      NegociosState(
        status: status ?? this.status,
        negocios: negocios ?? this.negocios,
      );

  @override
  List<Object> get props => [status, negocios];
}
