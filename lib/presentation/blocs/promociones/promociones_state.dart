part of 'promociones_bloc.dart';

enum PromocionesStatus {
  fetching,
  completed,
}

class PromocionesState extends Equatable {
  final PromocionesStatus status;
  final List<Promociones> promociones;
  final Promociones promocion;

  const PromocionesState(
      {this.status = PromocionesStatus.fetching,
      this.promociones = const [],
      this.promocion = const Promociones(
          id: '',
          descripcion: '',
          categorias: [],
          productos: [],
          descuento: 0,
          fechaCreacion: '',
          photoUrl: '',
          vigencia: '',
          uid: '')});

  PromocionesState copyWith({
    PromocionesStatus? status,
    List<Promociones>? promociones,
    Promociones? promocion,
  }) =>
      PromocionesState(
          status: status ?? this.status,
          promociones: promociones ?? this.promociones,
          promocion: promocion ?? this.promocion);

  @override
  List<Object> get props => [status, promociones, promocion];
}

final class PromocionesInitial extends PromocionesState {}
