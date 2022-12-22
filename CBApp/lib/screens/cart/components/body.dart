import 'package:flutter/material.dart';
import '../../../models/Product.dart';
import 'package:url_launcher/url_launcher.dart';

class Body0 extends StatefulWidget {
  final List<Product> _cart;

  Body0(this._cart);

  @override
  State<Body0> createState() => _Body0State(this._cart);
}

class _Body0State extends State<Body0> {
  _Body0State(this._cart);

  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;
  List<Product> _cart;

  Container pagoTotal(List<Product> _cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Colors.green[200],
      child: Row(
        children: [
          Text(
            "TOTAL: \$${valorTotal(_cart)}",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black),
          )
        ],
      ),
    );
  }

  String valorTotal(List<Product> listaProductos) {
    double total = 0.0;
    for (int i = 0; i < listaProductos.length; i++) {
      total = total + listaProductos[i].price * listaProductos[i].quantity;
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.restaurant_menu),
            onPressed: null,
            color: Colors.white,
          )
        ],
        title: Text(
          "Detalle de la Orden",
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (_enabled && _firstScroll) {
            _scrollController
                .jumpTo(_scrollController.position.pixels - details.delta.dy);
          }
        },
        onVerticalDragEnd: (_) {
          if (_enabled) _firstScroll = false;
        },
        child: SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _cart.length,
              itemBuilder: (context, index) {
                var item = _cart[index];
                return Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                width: 100,
                                height: 100,
                                child: new Image.asset(
                                    _cart[index].images.toString(),
                                    fit: BoxFit.contain),
                              )),
                              Column(
                                children: [
                                  Text(
                                    item.title,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.green[600],
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 6.0,
                                                color: Color.fromARGB(
                                                    255, 0, 198, 79),
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            )),
                                        margin: EdgeInsets.only(top: 20.0),
                                        padding: EdgeInsets.all(2.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            IconButton(
                                              icon: Icon(Icons
                                                  .remove_circle_outline_rounded),
                                              onPressed: () {
                                                _removeProduct(index);
                                                valorTotal(_cart);
                                              },
                                              color: Colors.green,
                                            ),
                                            Text(
                                              "${_cart[index].quantity}",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22.0,
                                                  color: Colors.white),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons
                                                  .add_circle_outline_rounded),
                                              onPressed: () {
                                                _addProduct(index);
                                                valorTotal(_cart);
                                              },
                                              color:
                                                  Color.fromARGB(255, 2, 50, 0),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 38.0,
                              ),
                              Text(
                                item.price.toString(),
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      )),
                  Divider(
                    color: Colors.green,
                  )
                ]);
              },
            ),
            SizedBox(
              width: 10.0,
            ),
            pagoTotal(_cart),
            SizedBox(
              width: 10.0,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                            backgroundColor: Color.fromRGBO(106, 255, 111, 1),
                            title: const Text("ENVIAR PEDIDO"),
                            contentPadding: const EdgeInsets.all(20.0),
                            children: [
                              Text("Enviar Orden"),
                              TextButton(
                                onPressed: () {
                                  msgListaPedido();
                                },
                                child: const Text("Ordenar"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancelar"),
                              ),
                            ],
                          ));
                },
                child: const Text("PEDIR ORDEN"),
              ),
            )
          ]),
        ),
      ),
    );
  }

  _addProduct(int index) {
    setState(() {
      _cart[index].quantity++;
    });
  }

  _removeProduct(int index) {
    setState(() {
      _cart[index].quantity--;
    });
  }

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
}
