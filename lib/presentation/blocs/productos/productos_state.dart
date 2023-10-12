part of 'productos_bloc.dart';

enum ProductosStatus {
  fetching,
  completed,
}

class ProductosState extends Equatable {
  final ProductosStatus status;
  final List<Productos> productos;
  final Productos producto;
  final List<Productos> favoritos;

  const ProductosState(
      {this.status = ProductosStatus.fetching,
      this.productos = const [],
      this.favoritos = const [],
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
    List<Productos>? favoritos,
    Productos? producto,
  }) =>
      ProductosState(
          status: status ?? this.status,
          productos: productos ?? this.productos,
          favoritos: favoritos ?? this.favoritos,
          producto: producto ?? this.producto);

  @override
  List<Object> get props => [status, productos, producto, favoritos];
}
