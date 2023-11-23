part of 'cupones_bloc.dart';

enum CuponesStatus {
  fetching,
  completed,
}

class CuponesState extends Equatable {
  final CuponesStatus status;
  final List<Cupones> cupones;
  final List<Cupones> cuponesByNegocio;
  final Cupones cupon;

  const CuponesState(
      {this.status = CuponesStatus.fetching,
      this.cupones = const [],
      this.cuponesByNegocio = const [],
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
        idNegocio: '',
      )});

  CuponesState copyWith({
    CuponesStatus? status,
    List<Cupones>? cupones,
    List<Cupones>? cuponesByNegocio,
    Cupones? cupon,
  }) =>
      CuponesState(
          status: status ?? this.status,
          cupones: cupones ?? this.cupones,
          cuponesByNegocio: cuponesByNegocio ?? this.cuponesByNegocio,
          cupon: cupon ?? this.cupon);

  @override
  List<Object> get props => [status, cupones, cupon, cuponesByNegocio];
}
