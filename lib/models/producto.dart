class Producto{

  //atributos
  String productoId;
  String nombre;
  double precio;

  //constructor
  Producto ({required this.productoId, required this.nombre, required this.precio});

  //método que retorna el producto como un mapa
  Map<String, dynamic> toMap(){
    return {
        'productoId' : productoId,
        'nombre' : nombre,
        'precio' : precio
    };
  }

  //constructor que convierte de firestore a un objeto Producto
  Producto.fromFirestore(Map<String, dynamic> firestore) :
      productoId = firestore['productoId'],
      nombre = firestore['nombre'],
      precio = firestore['precio'];



}