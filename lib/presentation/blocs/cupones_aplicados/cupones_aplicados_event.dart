part of 'cupones_aplicados_bloc.dart';

class CuponesAplicadosEvent {
  const CuponesAplicadosEvent();
}

class CuponesAplicadosFetched extends CuponesAplicadosEvent {
  final String idUsuario;

  const CuponesAplicadosFetched(this.idUsuario);
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
}
