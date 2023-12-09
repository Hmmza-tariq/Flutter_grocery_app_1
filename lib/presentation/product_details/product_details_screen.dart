import 'package:abc/data/models/product.dart';
import 'package:abc/presentation/product_details/components/product_detail.dart';
import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Receive object from pushNamed Route
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return SafeArea(
      child: Scaffold(
        body: ProductDetails(product: product),
      ),
    );
  }
}
