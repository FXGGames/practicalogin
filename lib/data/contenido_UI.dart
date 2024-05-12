class ContenidoUI {
  String image;
  String titulo;
  String descripcion;

  ContenidoUI(
      {required this.image, required this.titulo, required this.descripcion});
}

List<ContenidoUI> contenido = [
  ContenidoUI(
      image: "lib/assets/saludo.png",
      titulo: "N E O S E Ñ A S",
      descripcion: "Bienvenido a Neoseñas!"),
  //Primer contenido
  ContenidoUI(
      image: "lib/assets/bienvenida_1.png",
      titulo: "¿Que es Neoseñas?",
      descripcion:
          "Neoseñas es un proyecto que busca que la comunidad sorda pueda proponer nuevas ideas!"),
  //Segundo contenido
  ContenidoUI(
      image: "lib/assets/bienvenida_2.png",
      titulo: "¿Porque Neoseñas?",
      descripcion:
          "Algunas palabras no existen en los gestos de los sordos, por lo que a veces es muy complicado para ellos darse a entender"),
  //Tercer Contenido
  ContenidoUI(
      image: "lib/assets/bienvenida_3.png",
      titulo: "Divierte, aprende y propone!",
      descripcion:
          "Puedes dar algunas ideas innovadoras para algunos gestos, asi que : ¿Porque no intentarlo?")
];
