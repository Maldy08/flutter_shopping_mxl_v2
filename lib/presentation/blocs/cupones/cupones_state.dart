part of 'cupones_bloc.dart';

enum CuponesStatus {
  fetching,
  completed,
}

class CuponesState extends Equatable {
  final CuponesStatus status;
  final List<Cupones> cupones;
  final Cupones cupon;

  const CuponesState(
      {this.status = CuponesStatus.fetching,
      this.cupones = const [],
      this.cupon = const Cupones(
        id: '',
        descripcion: '',
        categorias: [],
        productos: [],
        descuento: 0,
        fechaCreacion: '',
        photoUrl: '',
        vigencia: '',
        uid: '',
      )});

  CuponesState copyWith({
    CuponesStatus? status,
    List<Cupones>? cupones,
    Cupones? cupon,
  }) =>
      CuponesState(
          status: status ?? this.status,
          cupones: cupones ?? this.cupones,
          cupon: cupon ?? this.cupon);

  @override
  List<Object> get props => [status, cupones, cupon];
}
