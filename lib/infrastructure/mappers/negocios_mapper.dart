import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';

class NegociosMapper {
  static Negocios negociosToEntity(Negocios negocios) => Negocios(
        ciudad: negocios.ciudad,
        correo: negocios.correo,
        direccion: negocios.direccion,
        estado: negocios.estado,
        giroEmpresa: negocios.giroEmpresa,
        horario: negocios.horario,
        id: negocios.id,
        nombreEmpresa: negocios.nombreEmpresa,
        nombreEncargado: negocios.nombreEncargado,
        numeroEmpleados: negocios.numeroEmpleados,
        pais: negocios.pais,
        photoUrl: negocios.photoUrl,
        telefono: negocios.telefono,
      );
}
