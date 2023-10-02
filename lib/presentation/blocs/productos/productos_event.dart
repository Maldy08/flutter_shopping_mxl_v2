part of 'productos_bloc.dart';

class ProductosEvent {
  const ProductosEvent();
}

class ProductosFetchedById extends ProductosEvent {
  final String id;
  final String uid;

  ProductosFetchedById(this.id, this.uid);
}
