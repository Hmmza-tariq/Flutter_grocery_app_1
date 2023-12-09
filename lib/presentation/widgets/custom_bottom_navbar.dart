// import 'package:abc/presentation/bloc/cart/cart_bloc.dart';
// import 'package:abc/presentation/bloc/cart/cart_event.dart';
import 'package:abc/presentation/home/home_screen.dart';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/enums.dart';
import 'package:flutter/material.dart';

import 'custom_page_transition.dart';

class CustomButtomNavBar extends StatelessWidget {
  final MenuState selectedMenu;
  const CustomButtomNavBar({Key? key, required this.selectedMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home_sharp,
                  color: MenuState.home == selectedMenu
                      ? ColorManager.primaryColor
                      : ColorManager.secondaryColor),
              onPressed: () {
                // Navigator.pushNamed(context, HomeScreen.routeName);
                Navigator.push(
                    context,
                    CustomScaleTransition(
                        nextPageUrl: HomeScreen.routeName,
                        nextPage: const HomeScreen()));
              },
            ),
            IconButton(
                icon: Icon(Icons.favorite_outline_sharp,
                    color: MenuState.favourite == selectedMenu
                        ? ColorManager.primaryColor
                        : ColorManager.inActiveIconColor),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  // CustomScaleTransition(
                  //     nextPageUrl: FavouriteScreen.routeName,
                  //     nextPage: const FavouriteScreen())
                }),
            IconButton(
                icon: Icon(
                  Icons.supervised_user_circle_outlined,
                  color: MenuState.profile == selectedMenu
                      ? ColorManager.primaryColor
                      : ColorManager.inActiveIconColor,
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     CustomScaleTransition(
                  //         nextPageUrl: ProfileScreen.routeName,
                  //         nextPage: const ProfileScreen()));
                }),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: MenuState.cart == selectedMenu
                      ? ColorManager.primaryColor
                      : ColorManager.inActiveIconColor),
              onPressed: () {
                // BlocProvider.of<CartBloc>(context)
                //     .add(const FetchCartProductsEvent());
                // Navigator.push(
                //     context,
                //     CustomScaleTransition(
                //         nextPageUrl: CartScreen.routeName,
                //         nextPage: const CartScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
