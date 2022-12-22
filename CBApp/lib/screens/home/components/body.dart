import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/search/country_search.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../auth/main_page.dart';
import '../../cart/components/body.dart';
import 'categories.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'discount_banner.dart';
import 'special_offers.dart';
import '../components/search/country/country.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Product> _listaCarro = <Product>[];
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  bool isOpened = false;
  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Country> countries = [
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
    return SideMenu(
        key: _endSideMenuKey,
        inverse: true, // end side menu
        background: Colors.green[700],
        type: SideMenuType.slideNRotate,
        menu: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: buildMenu(),
        ),
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: SideMenu(
            key: _sideMenuKey,
            menu: buildMenu(),
            type: SideMenuType.slideNRotate,
            onChange: (_isOpened) {
              setState(() => isOpened = _isOpened);
            },
            child: IgnorePointer(
                ignoring: isOpened,
                child: Scaffold(
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
                            onTap: () {
                              if (_listaCarro.isNotEmpty) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Body0(_listaCarro)),
                                );
                              }
                            },
                          ),
                        )
                      ],
                      leading: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => toggleMenu(true),
                      ),
                    ),
                    body: SingleChildScrollView(
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
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hola, Que tal",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Inicio"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Productos"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                        backgroundColor: Color.fromRGBO(106, 255, 111, 1),
                        title: const Text("UBICACIÓN"),
                        contentPadding: const EdgeInsets.all(20.0),
                        children: [
                          Text(
                              "Direccion de Centro de Biotecnologia Agropecuario"),
                          Text("Cl. 17, Mosquera, Cundinamarca"),
                        ],
                      ));
            },
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Ubicación"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
