import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productslunagerardo/models/producto.dart';

class FirestoreService{

  //declaramos una instancia de nuestra base de datos
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //método para guardar productos
  Future guardarProducto(Producto producto){
    return _db.collection('productos')
            .doc(producto.productoId)
            .set(producto.toMap());
  }

  //metodo para obtener los productos de la BD
  Stream<List<Producto>> getProductos(){
    return _db.collection('productos').snapshots().map((snapshot) => snapshot
    .docs.map((document) => Producto.fromFirestore(document.data())).toList());
  }

  //metodo para eliminar un prodcuto
  Future eliminarProducto(String productoId){
    return _db.collection('productos').doc(productoId).delete();
  }

}