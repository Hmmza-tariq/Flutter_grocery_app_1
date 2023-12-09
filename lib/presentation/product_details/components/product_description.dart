import 'package:abc/data/models/product.dart';
import 'package:abc/presentation/resources/font_manager.dart';
import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

import 'product_colors.dart';

class ProductDescription extends StatelessWidget {
  final Product product;
  const ProductDescription({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product's title widget
          Padding(
            padding: EdgeInsets.only(
                bottom: SizeConfig.getProportionateScreenHeight(10)),
            child: Center(
              child: Text(
                product.title,
                style: productTitleStyle,
              ),
            ),
          ),

          // Product Colors
          ProductQuantityList.productQuantityList(
              productQuantity: product.quantity),

          // Product Description
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.getProportionateScreenHeight(20)),
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.getProportionateScreenWidth(20),
                right: SizeConfig.getProportionateScreenWidth(64),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product's Headline
                  Text(
                    product.description["headline"]!,
                    style: productHeadlineStyle,
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(5),
                  ),
                  // Product's description
                  Opacity(
                    opacity: 0.50,
                    child: Text(
                      product.description["description"]!,
                      maxLines: 3,
                      style: productDescriptionStyle,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(5),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: kBannerTextStyle.copyWith(
                                fontSize: FontSize.s18)),
                        Text(
                          "Rs ${product.price}",
                          style: priceTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
