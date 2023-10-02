import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/infrastructure.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/productos.dart';

part 'productos_event.dart';
part 'productos_state.dart';

class ProductosBloc extends Bloc<ProductosEvent, ProductosState> {
  final FirebaseProductosRepositoryImpl _firebaseNegociosRepositoryImpl;

  ProductosBloc(
      {FirebaseProductosRepositoryImpl? firebaseProductosRepositoryImpl})
      : _firebaseNegociosRepositoryImpl = firebaseProductosRepositoryImpl ??
            FirebaseProductosRepositoryImpl(),
        super(ProductosInitial()) {
    on<ProductosFetched>(_fetchProductos);
    on<ProductosFetchedById>(_fetchProductoById);
  }

  Future<void> _fetchProductos(
      ProductosFetched event, Emitter<ProductosState> emit) async {
    emit(state.copyWith(status: ProductosStatus.fetching));
    await Future.delayed(const Duration(seconds: 2));
    final productos =
        await _firebaseNegociosRepositoryImpl.getProductos(uid: event.uid);
    emit(state.copyWith(
        productos: productos, status: ProductosStatus.completed));
  }

  Future<void> _fetchProductoById(
      ProductosFetchedById event, Emitter<ProductosState> emit) async {
    emit(state.copyWith(status: ProductosStatus.fetching));

    final producto = state.productos
        .where((element) => element.id == event.id && element.uid == event.uid);
    if (producto.isEmpty) return;

    emit(state.copyWith(
        producto: producto.first, status: ProductosStatus.completed));
  }
}
