import 'package:abc/data/models/product.dart';
import 'package:abc/presentation/resources/assets_manager.dart';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/font_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.lightestPrimaryColor,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 140.0))),
              child: Column(children: [
                const SizedBox(
                  height: AppSize.s36,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          ImageAssets.back,
                          width: AppSize.s40,
                          height: AppSize.s40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s18,
                ),
                FractionallySizedBox(
                  alignment: Alignment.center,
                  widthFactor: 0.6,
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
              ]),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.product.title,
                          style: productTitleStyle,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (() {
                                setState(() {
                                  itemCount++;
                                });
                              }),
                              child: Image.asset(
                                ImageAssets.add,
                                width: AppSize.s32,
                                height: AppSize.s32,
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s12,
                            ),
                            Text(
                              "$itemCount",
                              style: productHeadlineStyle,
                            ),
                            const SizedBox(
                              width: AppSize.s12,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (itemCount > 0) itemCount--;
                                });
                              },
                              child: Image.asset(
                                ImageAssets.remove,
                                width: AppSize.s32,
                                height: AppSize.s32,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Text(
                      "$itemCount kg, Rs ${(widget.product.price * itemCount).ceil()}",
                      style: priceTextStyle),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  Text(
                    widget.product.description["description"]!,
                    style: productDescriptionStyle,
                  ),
                  const SizedBox(
                    height: AppSize.s32,
                  ),
                  Row(
                    children: [
                      _itemKeyPointsView(
                          ImageAssets.organic, "100%", "Organic"),
                      const SizedBox(
                        width: 8,
                      ),
                      _itemKeyPointsView(
                          ImageAssets.expiration, "2 Week", "Expiration")
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      _itemKeyPointsView(ImageAssets.reviews, "4.8", "Reviews"),
                      const SizedBox(
                        width: 8,
                      ),
                      _itemKeyPointsView(
                          ImageAssets.calories, "80 kcal", "100 Gram")
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, MyRoutes.cartRoute);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0xff23AA49),
                        ),
                        child: Text(
                          AppStrings.addToCart,
                          style: textStyle.copyWith(color: ColorManager.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemKeyPointsView(String imagePath, String title, String desc) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: const Color(0xffF1F1F5))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff23AA49)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(desc,
                    style: const TextStyle(
                        fontSize: 14, color: Color(0xff979899))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
