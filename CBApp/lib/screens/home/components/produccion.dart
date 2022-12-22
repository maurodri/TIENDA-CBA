import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../models/Product.dart';
import '../../auth/auth_page.dart';
import '../../auth/inicio_boton.dart';
import '../../auth/main_page.dart';
import '../../cart/components/body.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../components/body.dart';

class Plantas extends StatefulWidget {
  const Plantas({Key? key}) : super(key: key);

  @override
  State<Plantas> createState() => _PlantasState();
}

class _PlantasState extends State<Plantas> {
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
                    backgroundColor: Color.fromARGB(255, 50, 186, 54),
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
                    body: ListView.builder(
                        itemCount: demoProducts.length,
                        itemBuilder: (context, index) {
                          var item = demoProducts[index];
                          return Card(
                              elevation: 5,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 250,
                                          height: 250,
                                          child: Image(
                                            image: NetworkImage(
                                                demoProducts[index]
                                                    .images
                                                    .toString()),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                ),
                                                child: Text(
                                                  demoProducts[index]
                                                      .title
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                ),
                                                child: Text(demoProducts[index]
                                                    .price
                                                    .toString()),
                                              ),
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
                                            ],
                                          ),
                                        ))
                                      ])));
                        })))));
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Body()),
              );
            },
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
            leading:
                const Icon(Icons.location_on, size: 20.0, color: Colors.white),
            title: const Text("Ubicación"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: const Icon(Icons.exit_to_app_rounded,
                size: 20.0, color: Colors.white),
            title: const Text("Cerrar Sesion"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
