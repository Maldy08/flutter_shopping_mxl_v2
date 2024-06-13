part of 'promociones_aplicadas_bloc.dart';

class PromocionesAplicadasEvent {
  const PromocionesAplicadasEvent();
}

class PromocionesAplicadasFetched extends PromocionesAplicadasEvent {
  final String idUsuario;

  const PromocionesAplicadasFetched(this.idUsuario);
}

class PromocionesAplicadasSave extends PromocionesAplicadasEvent {
  final String idPromocion;
  final String descripcion;
  final String idNegocio;
  final String nombreNegocio;
  final String idUsuario;
  final String vigencia;

  const PromocionesAplicadasSave(
      {required this.idPromocion,
      required this.descripcion,
      required this.idNegocio,
      required this.nombreNegocio,
      required this.idUsuario,
      required this.vigencia});
}
