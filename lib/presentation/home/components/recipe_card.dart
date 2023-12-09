import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.getProportionateScreenWidth(10),
        right: SizeConfig.getProportionateScreenWidth(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: SizeConfig.getProportionateScreenWidth(200),
        child: Image.asset(
          path,
          fit: BoxFit.fill,
          scale: 4.0,
        ),
      ),
    );
  }
}
