import 'package:abc/presentation/home/components/recipe_card.dart';
import 'package:abc/presentation/resources/assets_manager.dart';
import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Recipes extends StatelessWidget {
  Recipes({Key? key}) : super(key: key);
  List<String> paths = [
    ImageAssets.recipe_1,
    ImageAssets.recipe_2,
    ImageAssets.recipe_3
  ];
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
              "Recipes",
              style: kSearchFieldTextStyle,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.getProportionateScreenHeight(10)),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 10, 10, 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(paths.length, (index) {
                  return RecipeCard(path: paths[index]);
                }),
              ],
            ),
          ),
        ),
        // const TextBanner(),
      ],
    );
    // })
  }
}
