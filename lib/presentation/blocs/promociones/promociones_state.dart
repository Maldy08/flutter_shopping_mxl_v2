part of 'promociones_bloc.dart';

enum PromocionesStatus {
  fetching,
  completed,
}

class PromocionesState extends Equatable {
  final PromocionesStatus status;
  final List<Promociones> promociones;
  final Promociones promocion;
  final List<Promociones> promocionesByNegocio;

  const PromocionesState(
      {this.status = PromocionesStatus.fetching,
      this.promociones = const [],
      this.promocionesByNegocio = const [],
      this.promocion = const Promociones(
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

  PromocionesState copyWith({
    PromocionesStatus? status,
    List<Promociones>? promociones,
    List<Promociones>? promocionesByNegocio,
    Promociones? promocion,
  }) =>
      PromocionesState(
          status: status ?? this.status,
          promociones: promociones ?? this.promociones,
          promocionesByNegocio:
              promocionesByNegocio ?? this.promocionesByNegocio,
          promocion: promocion ?? this.promocion);

  @override
  List<Object> get props =>
      [status, promociones, promocion, promocionesByNegocio];
}

final class PromocionesInitial extends PromocionesState {}
