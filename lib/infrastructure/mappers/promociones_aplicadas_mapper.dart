import 'package:flutter_shopping_mxl_v2/infrastructure/models/promociones_aplicadas.dart';

class PromocionesAplicadasMapper {
  static PromocionesAplicadas promocionesAplicadasToEntity(
          PromocionesAplicadas promocionesAplicadas) =>
      PromocionesAplicadas(
        id: promocionesAplicadas.id,
        idPromocion: promocionesAplicadas.idPromocion,
        descripcion: promocionesAplicadas.descripcion,
        idUsuario: promocionesAplicadas.idUsuario,
        idNegocio: promocionesAplicadas.idNegocio,
        nombreNegocio: promocionesAplicadas.nombreNegocio,
        fechaAplicada: promocionesAplicadas.fechaAplicada,
        vigencia: promocionesAplicadas.vigencia,
        vecesAplicada: promocionesAplicadas.vecesAplicada,
      );
}
