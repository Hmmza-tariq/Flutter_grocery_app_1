import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

class ProductQuantityList extends StatefulWidget {
  final List<int> productQuantity;
  const ProductQuantityList.productQuantityList(
      {Key? key, required this.productQuantity})
      : super(key: key);

  @override
  ProductQuantityListState createState() => ProductQuantityListState();
}

class ProductQuantityListState extends State<ProductQuantityList> {
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Family Size",
                style:
                    kSearchFieldTextStyle.copyWith(color: ColorManager.black)),
          ),
          const SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    widget.productQuantity.length,
                    (index) => productColorCard(
                          colorIndex: index,
                          quantity: widget.productQuantity[index],
                          isSelected: _selectedColor == index,
                        ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector productColorCard(
      {required int colorIndex,
      required bool isSelected,
      required int quantity}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = colorIndex;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(8)),
        height: SizeConfig.getProportionateScreenWidth(40),
        width: SizeConfig.getProportionateScreenWidth(105),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: isSelected ? ColorManager.primaryColor : Colors.black12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0f000000),
                blurRadius: 14,
                offset: Offset(0, 4),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            '$quantity Persons',
            style: colorTextStyle,
          ),
        ),
      ),
    );
  }
}
