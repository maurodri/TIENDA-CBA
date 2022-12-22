class Product {
  final int id;
  int quantity;
  final String title;
  final String description;
  final String images;
  // final List<Color> colors;
  final double price;

  Product(
      {required this.title,
      required this.description,
      required this.id,
      required this.images,
      required this.price,
      this.quantity = 1});
}

// Our demo Products

List<Product> popular = [
  Product(
    id: 1,
    images: "assets/images/huevos.png",
    title: "Huevos",
    price: 13000,
    description:
        "La ponedora de referencia desde hace más de 30 años en todo el mundo. ISA Brown se adapta a todos los climas y condiciones ambientales y es conocida mundialmente como la ponedora más “eficiente” del mercado, capaz de poner hasta 500 huevos de la mejor calidad. ¡Quienes realmente se preocupan por los resultados económicos finales, confían completamente en ISA Brown!",
  ),
  Product(
    id: 2,
    images: "assets/images/leche.png",
    title: "Leche ",
    price: 3200,
    description:
        "La leche es una mezcla de agua, proteínas, grasas, vitaminas, hidratos de carbono y minerales. Cada tipo de leche tiene diferentes propiedades, dependiendo de las sustancias que aparezcan en la mezcla: leche con calcio, entera, desnatada, con vitamina E,...etc",
  ),
  Product(
    id: 3,
    images: "assets/images/ramo de flores.png",
    title: "Ramo de rosas",
    price: 2000,
    description:
        "Los ramos están formados por uno o varios tipos de flor, y a su vez que estas sean de un mismo color o de colores variados",
  ),
  Product(
    id: 4,
    images: "assets/images/tomate.jpg",
    title: "Tomate",
    price: 4000,
    description:
        "El tomate es uno de los alimentos más consumidos en nuestro país pero ¿realmente conoces todos sus beneficios y características? Descubre todo acerca de los tomates en este interesante artículo \N Seguro que, cuando piensas en el tomate, te imaginas una ensalada, un sofrito, un buen zumo o una deliciosa sopa. Se ha convertido en un alimento imprescindible para cualquier dieta mediterránea que se precie",
  ),
  Product(
    id: 5,
    images: "assets/images/miel.png",
    title: "Miel ",
    price: 5000,
    description:
        "La miel es un alimento nutritivo, saludable y natural producido por las abejas. Sus propiedades benéficas van mas allá del uso como dulcificante, ya que es rico en sales minerales, enzimas, vitaminas y proteínas que le donan propiedades nutritivas y organolépticas únicas",
  ),
];
List<Product> demoProducts = [
  new Product(
    id: 6,
    title: 'Huevo AA',
    price: 15000,
    images: "assets/images/huevos.png",
    description:
        "La ponedora de referencia desde hace más de 30 años en todo el mundo. ISA Brown se adapta a todos los climas y condiciones ambientales y es conocida mundialmente como la ponedora más “eficiente” del mercado, capaz de poner hasta 500 huevos de la mejor calidad. ¡Quienes realmente se preocupan por los resultados económicos finales, confían completamente en ISA Brown! LLEVE EL HUEVO AA DELICIAS A OTRO NIVEL",
  ),
  new Product(
    id: 7,
    title: 'Huevo AAA',
    price: 18000,
    images: "assets/images/huevos.png",
    description:
        "La ponedora de referencia desde hace más de 30 años en todo el mundo. ISA Brown se adapta a todos los climas y condiciones ambientales y es conocida mundialmente como la ponedora más “eficiente” del mercado, capaz de poner hasta 500 huevos de la mejor calidad. ¡Quienes realmente se preocupan por los resultados económicos finales, confían completamente en ISA Brown! LLEVE EL HUEVO AAA TODO LO QUE DEBES TENER",
  ),
  new Product(
    id: 8,
    title: 'Huevo A',
    price: 13000,
    images: "assets/images/huevos.png",
    description:
        "La ponedora de referencia desde hace más de 30 años en todo el mundo. ISA Brown se adapta a todos los climas y condiciones ambientales y es conocida mundialmente como la ponedora más “eficiente” del mercado, capaz de poner hasta 500 huevos de la mejor calidad. ¡Quienes realmente se preocupan por los resultados económicos finales, confían completamente en ISA Brown! LLEVE EL HUEVO A TODO AL MEJOR price",
  ),
  new Product(
    id: 9,
    title: 'Huevo Feliz',
    price: 22000,
    images: "assets/images/huevos.png",
    description:
        "La ponedora de referencia desde hace más de 30 años en todo el mundo. ISA Brown se adapta a todos los climas y condiciones ambientales y es conocida mundialmente como la ponedora más “eficiente” del mercado, capaz de poner hasta 500 huevos de la mejor calidad. ¡Quienes realmente se preocupan por los resultados económicos finales, confían completamente en ISA Brown! LLEVE EL HUEVO FELIZ PARA UNA MENTE FELIZ",
  ),
  new Product(
    id: 10,
    title: 'Suculentas',
    price: 3000,
    images: "assets/images/suculenta.png",
    description:
        "Lo que caracteriza a las suculentas es su capacidad para almacenar agua en las hojas, mucha más que otros tipos de plantas asi que QUE ESPERA lleve una y viva la decoración",
  ),
  new Product(
    id: 11,
    title: 'Planta de interiores',
    price: 8000,
    images: "assets/images/interior.png",
    description:
        "La ponedora de referencia desde hace más de 30 años en todo el mundo. ISA Brown se adapta a todos los climas y condiciones ambientales y es conocida mundialmente como la ponedora más “eficiente” del mercado, capaz de poner hasta 500 huevos de la mejor calidad. ¡Quienes realmente se preocupan por los resultados económicos finales, confían completamente en ISA Brown! LLEVE EL HUEVO AAA TODO LO QUE DEBES TENER",
  ),
  new Product(
    id: 12,
    title: 'Planta Serpiente',
    price: 3000,
    images: "assets/images/planta_serpiente.png",
    description:
        "Esta planta elimina las toxinas que poco a poco se van acumulando en los ambientes interiores. Absorbe el óxido de nitrógeno y los formaldehídos dañinos que flotan en el aire asi que no esperes mas lleva la tuya y linpia el aire",
  ),
  new Product(
    id: 13,
    title: 'Planta arecaceae',
    price: 9000,
    images: "assets/images/arecaceae.png",
    description:
        "son una familia de plantas monocotiledóneas, la única familia del orden Arecales. Normalmente se las conoce como palmeras o palmas.",
  ),
  new Product(
    id: 14,
    title: 'Miel de Aveja',
    price: 5000,
    images: "assets/images/miell.png",
    description:
        "La ponedora de referencia desde hace más de 30 años en todo el mundo. ISA Brown se adapta a todos los climas y condiciones ambientales y es conocida mundialmente como la ponedora más “eficiente” del mercado, capaz de poner hasta 500 huevos de la mejor calidad. ¡Quienes realmente se preocupan por los resultados económicos finales, confían completamente en ISA Brown! LLEVE EL HUEVO AAA TODO LO QUE DEBES TENER",
  ),
  new Product(
    id: 15,
    title: 'Litro de Leche de Vaca',
    price: 3200,
    images: "assets/images/lechesita.png",
    description:
        "Esta planta elimina las toxinas que poco a poco se van acumulando en los ambientes interiores. Absorbe el óxido de nitrógeno y los formaldehídos dañinos que flotan en el aire asi que no esperes mas lleva la tuya y linpia el aire",
  ),
  new Product(
    id: 16,
    title: 'Libra--Queso Campesino',
    price: 7000,
    images: "assets/images/quesos.png",
    description:
        "son una familia de plantas monocotiledóneas, la única familia del orden Arecales. Normalmente se las conoce como palmeras o palmas.",
  ),
  new Product(
    id: 17,
    title: 'Arequipe 500mg',
    price: 8000,
    images: "assets/images/arequipe.png",
    description:
        "La ponedora de referencia desde hace más de 30 años en todo el mundo. ISA Brown se adapta a todos los climas y condiciones ambientales y es conocida mundialmente como la ponedora más “eficiente” del mercado, capaz de poner hasta 500 huevos de la mejor calidad. ¡Quienes realmente se preocupan por los resultados económicos finales, confían completamente en ISA Brown! LLEVE EL HUEVO AAA TODO LO QUE DEBES TENER",
  ),
  new Product(
    id: 18,
    title: 'Ramo de flores',
    price: 3000,
    images: "assets/images/ramo de flores.png",
    description:
        "Esta planta elimina las toxinas que poco a poco se van acumulando en los ambientes interiores. Absorbe el óxido de nitrógeno y los formaldehídos dañinos que flotan en el aire asi que no esperes mas lleva la tuya y linpia el aire",
  ),
  new Product(
    id: 19,
    title: 'Libra--Tomate',
    price: 9000,
    images: "assets/images/tomate.png",
    description:
        "son una familia de plantas monocotiledóneas, la única familia del orden Arecales. Normalmente se las conoce como palmeras o palmas.",
  ),
];
