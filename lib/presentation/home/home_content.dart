import 'package:abc/presentation/home/components/categories_view.dart';
import 'package:abc/presentation/home/components/special_product.dart';
import 'package:abc/presentation/home/components/see_all_view.dart';
import 'package:abc/presentation/resources/enums.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:abc/presentation/widgets/custom_bottom_navbar.dart';
import 'package:abc/presentation/widgets/custom_button.dart';
import 'package:abc/presentation/widgets/location.dart';
import 'package:abc/presentation/resources/assets_manager.dart';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/recipes.dart';
import 'components/text_banner.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late double xOffset, yOffset, scaleFactor;
  late bool isDrawerOpen;

  @override
  void initState() {
    super.initState();
    xOffset = yOffset = 0.0;
    scaleFactor = 1.0;
    isDrawerOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0.0)
          ..scale(scaleFactor),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            borderRadius: (isDrawerOpen)
                ? BorderRadius.circular(40)
                : BorderRadius.circular(0),
            color: Colors.white,
            boxShadow: [if (isDrawerOpen) ColorManager.drawerShadow]),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            // Header component
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08),
              child: Row(
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0.0;
                              yOffset = 0.0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: SvgPicture.asset(ImageAssets.hamburger),
                          onPressed: () {
                            setState(() {
                              xOffset =
                                  MediaQuery.of(context).size.width * 0.55;
                              yOffset =
                                  MediaQuery.of(context).size.height * 0.2;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Flexible(flex: 3, child: locationWidget()),
                  const Flexible(
                    // take the remaining space of the row
                    flex: 1,
                    child: SearchField(),
                  )
                ],
              ),
            ),
            // Banner component
            const TextBanner(),
            // Categories component
            seeAllView(context, "Categories"),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                categoriesView(ImageAssets.fruits, "Fruits"),
                categoriesView(ImageAssets.vegetables, "Vegetables"),
                categoriesView(ImageAssets.salad, "Szalad"),
                categoriesView(ImageAssets.juice, "Juice")
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p60),
              child: CustomButton(
                title: 'Customize Deal',
                onPressed: () {},
                foregroundColor: ColorManager.white,
                backgroundColor: ColorManager.primaryColor,
              ),
            ),
            // const Categories(),
            const SizedBox(
              height: 32,
            ),
            const SpecialProducts(),
            const Recipes(),
            const CustomButtonNavBar(selectedMenu: MenuState.home),
          ],
        ));
  }
}
