import 'package:flutter/material.dart';

Widget seeAllView(BuildContext context, String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {
            // Navigator.pushNamed(context, MyRoutes.vegetablesRoute);
          },
          child: Text(
            "See All",
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff23AA49),
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
