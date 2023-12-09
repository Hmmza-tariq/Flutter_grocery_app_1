import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:abc/data/models/product.dart';
import 'package:abc/Utilities/size_config.dart';

import 'special_card.dart';

class SpecialProducts extends StatefulWidget {
  const SpecialProducts({Key? key}) : super(key: key);

  @override
  State<SpecialProducts> createState() => _SpecialProductsState();
}

class _SpecialProductsState extends State<SpecialProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  SizeConfig.getProportionateScreenWidth(AppPadding.p30)),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Special Offers for you!",
              style: kSearchFieldTextStyle,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.getProportionateScreenWidth(20)),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 10, 10, 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(demoProducts.length, (index) {
                  if (demoProducts[index].isPopular) {
                    return ProductCard(product: demoProducts[index]);
                  }
                  return const SizedBox.shrink();
                }),
                SizedBox(width: SizeConfig.getProportionateScreenWidth(40)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
