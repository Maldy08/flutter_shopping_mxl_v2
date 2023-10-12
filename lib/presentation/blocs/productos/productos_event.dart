part of 'productos_bloc.dart';

class ProductosEvent {
  const ProductosEvent();
}

class ProductosFetched extends ProductosEvent {
  final String uid;
  ProductosFetched(this.uid);
}

class ProductosFetchedById extends ProductosEvent {
  final String id;
  final String uid;

  ProductosFetchedById(this.id, this.uid);
}

class FavoritosFetched extends ProductosEvent {
  final List<String> favoritos;

  FavoritosFetched(this.favoritos);
}

class ProductosFetchedAll extends ProductosEvent {
  const ProductosFetchedAll();
}
