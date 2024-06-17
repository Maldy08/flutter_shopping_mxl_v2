import 'package:flutter_shopping_mxl_v2/infrastructure/models/cupones_aplicados.dart';

class CuponesAplicadosMapper {
  static CuponesAplicados cuponesAplicadosToEntity(
          CuponesAplicados cuponesAplicados) =>
      CuponesAplicados(
        id: cuponesAplicados.id,
        idCupon: cuponesAplicados.idCupon,
        descripcion: cuponesAplicados.descripcion,
        idUsuario: cuponesAplicados.idUsuario,
        idNegocio: cuponesAplicados.idNegocio,
        nombreNegocio: cuponesAplicados.nombreNegocio,
        fechaAplicada: cuponesAplicados.fechaAplicada,
        vigencia: cuponesAplicados.vigencia,
        vecesAplicada: cuponesAplicados.vecesAplicada,
      );
}
