import 'package:abc/data/models/product.dart';
// import 'package:abc/presentation/bloc/cart/cart_bloc.dart';
// import 'package:abc/presentation/bloc/cart/cart_event.dart';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/widgets/default_button.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class DetailsScreenContent extends StatelessWidget {
  final Product product;
  const DetailsScreenContent({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<CartBloc>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(product: product, onSeeMorePressed: () {}),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.getProportionateScreenHeight(8.0)),
                    child: DefaultButton(
                      text: "Add to basket",
                      backgroundColor: ColorManager.primaryColor,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        // bloc.add(AddProductToCartEvent(
                        //     cartItem: CartItem(
                        //         product: product,
                        //         quantity: Random().nextInt(10))));
                      },
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
