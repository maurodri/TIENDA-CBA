import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          //movil
          return Container(
            height: 150,
            width: double.infinity,
            margin: EdgeInsets.all(getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(15),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 63, 201, 28),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "Sorpresa De Diciembre\n",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(25),
                    ),
                  ),
                  TextSpan(
                    text: "Cashback 20%",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            //desktop
            height: 250,
            width: double.infinity,
            margin: EdgeInsets.all(getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(15),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 63, 201, 28),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "Sorpresa De Diciembre\n",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                    ),
                  ),
                  TextSpan(
                    text: "Cashback 20%",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
