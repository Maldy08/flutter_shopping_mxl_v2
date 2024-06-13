part of 'promociones_aplicadas_bloc.dart';

enum PromocionesAplicadasStatus {
  fetching,
  completed,
  error,
  initial,
  applied,
  apliying,
}

class PromocionesAplicadasState extends Equatable {
  final PromocionesAplicadasStatus status;
  final List<PromocionesAplicadas> promocionesAplicadas;
  final PromocionesAplicadas promocionAplicada;

  const PromocionesAplicadasState({
    this.status = PromocionesAplicadasStatus.initial,
    this.promocionesAplicadas = const [],
    this.promocionAplicada = const PromocionesAplicadas(
      id: '',
      idNegocio: '',
      nombreNegocio: '',
      idPromocion: '',
      descripcion: '',
      fechaAplicada: '',
      idUsuario: '',
      vecesAplicada: 0,
      vigencia: '',
    ),
  });

  PromocionesAplicadasState copyWith({
    PromocionesAplicadasStatus? status,
    List<PromocionesAplicadas>? promocionesAplicadas,
    PromocionesAplicadas? promocionAplicada,
  }) =>
      PromocionesAplicadasState(
        status: status ?? this.status,
        promocionesAplicadas: promocionesAplicadas ?? this.promocionesAplicadas,
        promocionAplicada: promocionAplicada ?? this.promocionAplicada,
      );

  @override
  List<Object> get props => [status, promocionesAplicadas, promocionAplicada];
}
