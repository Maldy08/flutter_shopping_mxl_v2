part of 'productos_bloc.dart';

enum ProductosStatus {
  fetching,
  completed,
}

class ProductosState extends Equatable {
  final ProductosStatus status;
  final List<Productos> productos;
  final Productos producto;

  const ProductosState(
      {this.status = ProductosStatus.fetching,
      this.productos = const [],
      this.producto = const Productos(
        id: '',
        descripcion: '',
        idCategoria: '',
        idNegocio: '',
        nombreNegocio: '',
        precio: '',
        photoUrl: '',
        uid: '',
      )});

  ProductosState copyWith({
    ProductosStatus? status,
    List<Productos>? productos,
    Productos? producto,
  }) =>
      ProductosState(
          status: status ?? this.status,
          productos: productos ?? this.productos,
          producto: producto ?? this.producto);

  @override
  List<Object> get props => [status, productos, producto];
}

final class ProductosInitial extends ProductosState {}
