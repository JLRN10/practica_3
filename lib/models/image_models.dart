class ImageDAO {
  String? titulo;
  String? imagen;
  String? descripcion;

  // Construtor nombrado
  ImageDAO({this.titulo, this.imagen, this.descripcion});

  //Metodo de formateo a mapa
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'imagen': imagen,
      'descripcion': descripcion,
    };
  }
}
