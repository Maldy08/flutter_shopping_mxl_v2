import 'package:flutter_shopping_mxl_v2/infrastructure/models/cupones_aplicados.dart';

class CuponesAplicadosMapper {
  static CuponesAplicados cuponesAplicadosToEntity(
          CuponesAplicados cuponesAplicados) =>
      CuponesAplicados(
        id: cuponesAplicados.id,
        idCupon: cuponesAplicados.idCupon,
        idUsuario: cuponesAplicados.idUsuario,
        idNegocio: cuponesAplicados.idNegocio,
        fechaAplicada: cuponesAplicados.fechaAplicada,
        vigencia: cuponesAplicados.vigencia,
        vecesAplicada: cuponesAplicados.vecesAplicada,
      );
}
