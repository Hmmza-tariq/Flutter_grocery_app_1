import 'package:abc/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abc/Data/models/category.dart';

// import 'package:abc/presentation/bloc/search/search_bloc.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // late final bloc;
  @override
  void initState() {
    super.initState();
    // bloc = BlocProvider.of<SearchBloc>(context);
    // bloc.add(const FetchAllProductEvent());
  }

  static const TextStyle selectedItemStyle = TextStyle(
    color: ColorManager.primaryColor,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle unSelectedItemStyle = TextStyle(
    color: ColorManager.secondaryColor,
  );
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 10),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categories.length,
                (index) => bottomBorderContainer(index: index),
              )),
        ));
  }

  AnimatedContainer bottomBorderContainer({int? index, TextButton? child}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: (_selectedIndex == index)
                      ? ColorManager.primaryColor
                      : Colors.transparent,
                  width: 3))),
      child: TextButton(
          child: Text(categories[index!]["title"],
              style: (_selectedIndex == index)
                  ? selectedItemStyle
                  : unSelectedItemStyle),
          onPressed: () {
            // bloc.add(FetchProductByCategoryEvent(
            //     queryString: categories[index]["title"]));
            // setState(() {
            //   _selectedIndex = index;
            // });
          }),
    );
  }
}
