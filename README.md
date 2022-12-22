# TIENDA-CBA
Trabajo de tienda de CBA SENA trabajado con flutter

## se subieron los  archivos de la app sena tiendas 

aplicacion construida  de manera responsive con el fin de uso para andrid y desktop 

## navegacion

cuando iniciamos la app  nos dirige al inicio donde vemos una presentacion con un boton de continuar que nos retorna en una presentacion donde vemos diseño y procedencia con el siguiente codigo nos encargamos de la parte visual

```
SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: getProportionateScreenWidth(10)),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: MaterialButton(
                                  child: Text('Buscar Producto',
                                      style: TextStyle(color: Colors.white)),
                                  color: Colors.green,
                                  shape: StadiumBorder(),
                                  elevation: 0,
                                  onPressed: () {
                                    showSearch(
                                        context: context,
                                        delegate:
                                            CountrySearchDelegrate(countries));
                                  })),
                          Title(
                              color: Colors.black,
                              child: Text(
                                "Bienvenido ",
                                style: TextStyle(fontSize: 70),
                              )),
                          DiscountBanner(),
                          Categories(),
                          SpecialOffers(),
                        ],
                      ),
                    )))));
```

## Drawer

Se realizo un drawer con inclinacion con diferentes accesos, se uno la libreria ``` shrink_sidemenu: ^2.0.0+2-null-safety ``` en el pubspec.yaml.

### Implementacion 

Se implemento el drawer en el appbar con el siguiente codigo.
```
appBar: AppBar(
                      backgroundColor: Colors.green,
                      title: const Text('PRODUCTOS EN VENTA',
                          style: TextStyle(color: Colors.black)),
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                          child: GestureDetector(
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                const Icon(
                                  Icons.shopping_cart,
                                  size: 38,
                                ),
                                if (_listaCarro.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: CircleAvatar(
                                      radius: 8.0,
                                      backgroundColor:
                                          Color.fromARGB(255, 77, 255, 0),
                                      foregroundColor:
                                          Color.fromARGB(255, 0, 0, 0),
                                      child: Text(
                                        _listaCarro.length.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            
                          ),
                        )
                      ],
                      leading: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => toggleMenu(true),
                      ),
                    ),
```

## Carrito

Se implemento el carrito de la siguiente forma 
```
 onTap: () {
                              if (_listaCarro.isNotEmpty) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Body0(_listaCarro)),
                                );
                              }
                            },
```
### añadir item al carrito 

para esto unamos un if que verifica que se cree una nueva lista en donde llamaremos luego cuando se ejecute el carrito.

codigo para añadir el item.
```
IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (!_listaCarro
                                                        .contains(item)) {
                                                      _listaCarro.add(item);
                                                    } else {
                                                      _listaCarro.remove(item);
                                                    }
                                                  });
                                                },
                                                icon: (!_listaCarro
                                                        .contains(item))
                                                    ? const Icon(
                                                        Icons.shopping_cart)
                                                    : const Icon(
                                                        Icons
                                                            .shopping_cart_checkout,
                                                        color: Colors.green,
                                                      ),
                                                iconSize: 30,
                                              ),
```
## Lista de Productos

Los productos son predeterminados en lenguaje dart en donde se creo una lista para la funcionalidad de la app la cual contiene aspectos basicos que se nesesitan o se podran requerir 

```
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

```
para llamar a alguna de estas funciones usamos ```demoProducts[index].price.toString()``` el index que vemos es el valor que definimos normalmente por ejemplo se definio de la siguiente manera 
```
ListView.builder(
                        itemCount: demoProducts.length,
                        itemBuilder: (context, index) {
                          var item = demoProducts[index];
```
Usamos un ListView.builder con el fin de que construya una lista consecutiva con los valores que muestra ```itemCount: demoProducts.length``` de esta manera sabemos cuantas veces se repite y luego se usa ``` itemBuilder: (context, index) {}``` para definir el index que usamos y construir un retorno que nos muestra una card 

## Mensaje de whatsapp

usamos la siguiente libreria ```url_launcher: ^6.1.7``` con el fin de poder crear la url que nos llevara a whatsapp con el mendaje.

creamos un void con el fin de crear una accion con el fin de mandar el mensaje 
```
void msgListaPedido() async {
    String pedido = "";
    String fecha = DateTime.now().toString();

    pedido = pedido + "FECHA DE PEDIDO:" + fecha.toString();
    pedido = pedido + "\n";
    pedido = pedido + "COSTO DE DOMICILIO \$1000";
    pedido = pedido + "\n";
    pedido = pedido + "PEDIDOS CBAPP TU MEJOR OPCION";
    pedido = pedido + "\n";
    pedido = pedido + "*******************";
    pedido = pedido +
        "en caso de cancelar o cambiar el pedido comunicar con un plazo de 24H___________________Cl. 17, Mosquera, Cundinamarca SENA Mosquera - Centro de Biotecnología Agropecuaria (CBA), dirección";

    for (int i = 0; i < _cart.length; i++) {
      pedido = '$pedido' +
          "\n" +
          "  Productos: " +
          _cart[i].title +
          "\n" +
          "  Cantidad: " +
          _cart[i].quantity.toString() +
          "\n" +
          "  agradecemos su orden " +
          "\n" +
          "\******************\n";
    }
    pedido = pedido + " TOTAL:" + valorTotal(_cart);

    await launch("https://wa.me/${573022250366}?text=$pedido");
  }
```
usamos un for con el fin de construir el mensaje que se va a ocupar en el whatsapp,  donde declaramos un ```pedido``` en donde construimos el mensaje con las variables que usamos anteriormente , y usamos el await del tipo ```acync```  conde usamos   ```launch("https://wa.me/${573022250366}?text=$pedido")``` para crear el mensaje y poder ejecutarlo,  Este numero es inactivo tener cuidado.

## Busqueda

para la busqueda de productos creamos nuevas clases con el fin de cubrir cada aspecto de busqueda tanto sugerencias al escribir, resultados, en caso de un query nulo y una vista tanto animacion para esto se uso 
```
import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/search/services/country_services.dart';

import '../body.dart';
import '../produccion.dart';
import 'country/country.dart';

class CountrySearchDelegrate extends SearchDelegate<Country> {
  final List<Country> countries;
  late List<Country> _filter = [];
  CountrySearchDelegrate(this.countries);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => this.query = "", icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          this.close(context, Country(name: ''));
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().length == 0) {
      return Center(child: Text('Escribe un Producto'));
    }
    return Plantas();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = countries.where((country) {
      return country.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(_filter[index].name),
        );
      },
    );
  }
}
```

usamos buildSuggestions con el fin de las sugerencias al ir escribiendo 
usamos buildResults para que al realizar el enter en la busqueda nos muestre un resultado correspondiente 
usamos buildLeading con el fin de al precionar un icono de retroseso vuelva a la pantalla anterior 
usamos buildActions con el fin de al precionar un icono X nos elimine el query escrito a esto me refiero a lo que se escribio en la barra de busqueda

Para implementar el acceso a estas funciones se uso 
```
MaterialButton(
                                  child: Text('Buscar Producto',
                                      style: TextStyle(color: Colors.white)),
                                  color: Colors.green,
                                  shape: StadiumBorder(),
                                  elevation: 0,
                                  onPressed: () {
                                    showSearch(
                                        context: context,
                                        delegate:
                                            CountrySearchDelegrate(countries));
                                  })
```
usamos el valor showSearch con el fin de crear este valor 

### Lista de busqueda 

creamos una lista llamada countries con el fin de tener la lista de busqueda 
```
List<Country> countries = [
      Country(name: 'Huevos'),
      Country(name: 'Leche'),
      Country(name: 'Ramo de rosas'),
      Country(name: 'LIBRA -Tomate'),
      Country(name: 'Miel'),
      Country(name: 'Huevo AA'),
      Country(name: 'Huevo AAA'),
      Country(name: 'Huevo A'),
      Country(name: 'Huevo Feliz'),
      Country(name: 'Suculentas'),
      Country(name: 'Planta de interiores'),
      Country(name: 'Planta Serpiente'),
      Country(name: 'Planta arecaceae'),
      Country(name: 'Miel de Aveja'),
      Country(name: 'Litro de Leche de Vaca'),
      Country(name: 'Libra--Queso Campesino'),
      Country(name: 'Arequipe 500mg'),
      Country(name: 'Ramo de flores'),
    ];
```
