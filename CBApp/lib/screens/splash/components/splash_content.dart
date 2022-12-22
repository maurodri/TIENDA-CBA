import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return Column(
            children: <Widget>[
              Spacer(),
              Text(
                "CBApp",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(26),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text!,
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 2),
              Image.asset(
                image!,
                height: getProportionateScreenHeight(265),
                width: getProportionateScreenWidth(235),
              ),
            ],
          );
        } else {
          return Column(
            children: <Widget>[
              Spacer(),
              Text(
                "CBApp",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(26),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text!,
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 2),
              Image.asset(
                image!,
                height: getProportionateScreenHeight(65),
                width: getProportionateScreenWidth(235),
              ),
            ],
          );
        }
      },
    );
  }
}
