part of 'negocios_bloc.dart';

enum NegociosStatus {
  fetching,
  completed,
}

class NegociosState extends Equatable {
  final NegociosStatus status;
  final List<Negocios> negocios;
  final Negocios negocio;

  const NegociosState({
    this.status = NegociosStatus.fetching,
    this.negocios = const [],
    this.negocio = const Negocios(
      ciudad: '',
      correo: '',
      direccion: '',
      estado: '',
      giroEmpresa: '',
      horario: '',
      id: '',
      nombreEmpresa: '',
      nombreEncargado: '',
      numeroEmpleados: 0,
      pais: '',
      photoUrl: '',
      telefono: '',
    ),
  });

  NegociosState copyWith({
    NegociosStatus? status,
    List<Negocios>? negocios,
    Negocios? negocio,
  }) =>
      NegociosState(
        status: status ?? this.status,
        negocios: negocios ?? this.negocios,
        negocio: negocio ?? this.negocio,
      );

  @override
  List<Object> get props => [status, negocios, negocio];
}
