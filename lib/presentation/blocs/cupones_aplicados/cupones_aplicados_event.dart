part of 'cupones_aplicados_bloc.dart';

class CuponesAplicadosEvent extends Equatable {
  const CuponesAplicadosEvent();

  @override
  List<Object> get props => [];
}

class CuponesAplicadosFetched extends CuponesAplicadosEvent {
  final String idUsuario;

  const CuponesAplicadosFetched(this.idUsuario);

  @override
  List<Object> get props => [idUsuario];
}

class CuponesAplicadosSave extends CuponesAplicadosEvent {
  final String idCupon;
  final String descripcion;
  final String idNegocio;
  final String nombreNegocio;
  final String idUsuario;
  final String vigencia;

  const CuponesAplicadosSave({
    required this.idCupon,
    required this.descripcion,
    required this.idNegocio,
    required this.nombreNegocio,
    required this.idUsuario,
    required this.vigencia,
  });

  @override
  List<Object> get props => [idCupon, idNegocio, idUsuario, vigencia];
}
