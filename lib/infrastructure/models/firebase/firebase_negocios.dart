import 'package:equatable/equatable.dart';

class FirebaseNegocios extends Equatable {
  final String ciudad;
  final String correo;
  final String direccion;
  final String estado;
  final String giroEmpresa;
  final String horario;
  final String nombreEmpresa;
  final String nombreEncargado;
  final int numeroEmpleados;
  final String pais;
  final String? photoUrl;
  final String telefono;

  const FirebaseNegocios(
      this.ciudad,
      this.correo,
      this.direccion,
      this.estado,
      this.giroEmpresa,
      this.horario,
      this.nombreEmpresa,
      this.nombreEncargado,
      this.numeroEmpleados,
      this.pais,
      String? photoUrl,
      this.telefono)
      : photoUrl = photoUrl ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOCbukN6fX75wRMuFiJzdZ3tmvtON_NgFS4htEWMdgxmtr6okoSkIa0SgjPmO18XWzdcE&usqp=CAU';

  @override
  List<Object?> get props => throw UnimplementedError();
}
