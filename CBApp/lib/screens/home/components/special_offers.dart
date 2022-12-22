import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Title(
              color: Colors.black,
              child: Text(
                "Procedencia ",
                style: TextStyle(fontSize: 40),
              )),
        ),
        SizedBox(height: getProportionateScreenWidth(28)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/pollos.jpg",
                category: "Galpones",
                numOfBrands:
                    "Huevos frescos y saludables del galpon a tu mesa.",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/leche.jpg",
                category: "Produccion de Leche",
                numOfBrands: "Alegria a la proteina de la leche de vaca",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/flores.jpg",
                category: "Floricultura",
                numOfBrands: "Toda flor es un alma creciendo en la naturaleza",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/abejas.jpg",
                category: "Apicultura",
                numOfBrands: "La mejor miel de las mejores abejas criadas",
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final String numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: GestureDetector(
              onTap: press,
              child: SizedBox(
                width: getProportionateScreenWidth(339),
                height: getProportionateScreenWidth(190),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF343434).withOpacity(0.4),
                              Color(0xFF343434).withOpacity(0.15),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15.0),
                          vertical: getProportionateScreenWidth(10),
                        ),
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                text: "$category\n",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: "$numOfBrands")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Padding(
            //desktop
            padding: EdgeInsets.only(left: getProportionateScreenWidth(9)),
            child: GestureDetector(
              onTap: press,
              child: SizedBox(
                width: getProportionateScreenWidth(82),
                height: getProportionateScreenWidth(45.9),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF343434).withOpacity(0.4),
                              Color(0xFF343434).withOpacity(0.15),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15.0),
                          vertical: getProportionateScreenWidth(10),
                        ),
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 255, 8)),
                            children: [
                              TextSpan(
                                text: "$category\n",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(4.24),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: "$numOfBrands")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
