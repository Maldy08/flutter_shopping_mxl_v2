part of 'cupones_aplicados_bloc.dart';

enum CuponesAplicadosStatus {
  fetching,
  completed,
  error,
  initial,
  applied,
  apliying,
}

class CuponesAplicadosState extends Equatable {
  final CuponesAplicadosStatus status;
  final List<CuponesAplicados> cuponesAplicados;
  final CuponesAplicados cuponAplicado;

  const CuponesAplicadosState({
    this.status = CuponesAplicadosStatus.initial,
    this.cuponesAplicados = const [],
    this.cuponAplicado = const CuponesAplicados(
      id: '',
      idNegocio: '',
      nombreNegocio: '',
      idCupon: '',
      descripcion: '',
      fechaAplicada: '',
      idUsuario: '',
      vecesAplicada: 0,
      vigencia: '',
    ),
  });

  CuponesAplicadosState copyWith({
    CuponesAplicadosStatus? status,
    List<CuponesAplicados>? cuponesAplicados,
    CuponesAplicados? cuponAplicado,
  }) =>
      CuponesAplicadosState(
        status: status ?? this.status,
        cuponesAplicados: cuponesAplicados ?? this.cuponesAplicados,
        cuponAplicado: cuponAplicado ?? this.cuponAplicado,
      );

  @override
  List<Object> get props => [status, cuponesAplicados, cuponAplicado];
}
