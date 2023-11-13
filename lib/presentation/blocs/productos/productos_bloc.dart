import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/infrastructure/infrastructure.dart';
import '/infrastructure/models/productos.dart';

part 'productos_event.dart';
part 'productos_state.dart';

class ProductosBloc extends Bloc<ProductosEvent, ProductosState> {
  final FirebaseProductosRepositoryImpl _firebaseNegociosRepositoryImpl;

  ProductosBloc(
      {FirebaseProductosRepositoryImpl? firebaseProductosRepositoryImpl})
      : _firebaseNegociosRepositoryImpl = firebaseProductosRepositoryImpl ??
            FirebaseProductosRepositoryImpl(),
        super(const ProductosState()) {
    on<ProductosFetched>(_fetchProductos);
    on<ProductosFetchedById>(_fetchProductoById);
    on<FavoritosFetched>(_fetchFavorites);
    on<ProductosFetchedAll>(_fetchAll);
  }

  Future<void> _fetchProductos(
      ProductosFetched event, Emitter<ProductosState> emit) async {
    emit(state.copyWith(status: ProductosStatus.fetching));
    // await Future.delayed(const Duration(seconds: 2));
    final productos =
        await _firebaseNegociosRepositoryImpl.getProductos(uid: event.uid);
    emit(state.copyWith(
        productosByNegocio: productos, status: ProductosStatus.completed));
  }

  Future<void> _fetchProductoById(
      ProductosFetchedById event, Emitter<ProductosState> emit) async {
    emit(state.copyWith(status: ProductosStatus.fetching, producto: null));

    final producto = state.productos.where((element) => element.id == event.id);
    if (producto.isEmpty) return;

    emit(state.copyWith(
        producto: producto.first, status: ProductosStatus.completed));
  }

  Future<void> _fetchFavorites(
      FavoritosFetched event, Emitter<ProductosState> emit) async {
    if (event.favoritos.isEmpty) return;
    emit(state.copyWith(status: ProductosStatus.fetching));

    final favoritos = event.favoritos.map((e) => e).toList();
    final productos = await _firebaseNegociosRepositoryImpl
        .getUserFavoritesProducts(favoritos: favoritos);
    emit(state.copyWith(
        status: ProductosStatus.completed, favoritos: productos));

    //emit(state.copyWith(favoritos: favoritos));
  }

  Future<void> _fetchAll(
      ProductosFetchedAll event, Emitter<ProductosState> emit) async {
    emit(state.copyWith(status: ProductosStatus.fetching));
    final productos = await _firebaseNegociosRepositoryImpl.getAllProduct();
    emit(state.copyWith(
        status: ProductosStatus.completed, productos: productos));
  }
}
