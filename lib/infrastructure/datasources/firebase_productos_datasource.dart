import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_mxl_v2/domain/datasource/productos_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/mappers/productos_mapper.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/productos.dart';

class FirebaseProductosDataSource extends ProductosDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseProductosDataSource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Productos>> getAllProduct() async {
    List<Productos> list = [];
    final response = await _firebaseFirestore.collection('productos').get();

    for (var element in response.docs) {
      list.add(Productos.fromJson(element.data()));
    }

    final productos =
        list.map((e) => ProdcutosMapper.productosToEntity(e)).toList();

    return productos;
  }

  @override
  Future<List<Productos>> getProductos({required String uid}) async {
    List<Productos> list = [];
    final response = await _firebaseFirestore
        .collection('productos')
        .where('id_negocio', isEqualTo: uid)
        .get();

    for (var element in response.docs) {
      list.add(Productos.fromJson(element.data()));
    }

    final productos =
        list.map((e) => ProdcutosMapper.productosToEntity(e)).toList();

    return productos;
  }

  @override
  Future<Productos> getProductoById(
      {required String id, required String uid}) async {
    Productos? productos;
    await _firebaseFirestore
        .collection('negocios')
        .where('id', isEqualTo: id)
        .get()
        .then((value) {
      final docs = value.docs.first;
      productos = Productos.fromJson(docs.data());
    });

    return ProdcutosMapper.productosToEntity(productos!);
  }

  @override
  Future<List<Productos>> getUserFavoritesProducts(
      {required List<String> favoritos}) async {
    List<Productos> list = [];

    final response = await _firebaseFirestore
        .collection('productos')
        .where('id', whereIn: favoritos)
        .get();

    for (var element in response.docs) {
      list.add(Productos.fromJson(element.data()));
    }

    final productos =
        list.map((e) => ProdcutosMapper.productosToEntity(e)).toList();

    return productos;
  }
}
