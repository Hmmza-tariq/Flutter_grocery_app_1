import 'package:flutter/material.dart';

Widget categoriesView(String imagePath, String catName) {
  return Expanded(
    flex: 1,
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffF3F5F7),
          radius: 32,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              imagePath,
              scale: 4.0,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          catName,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        )
      ],
    ),
  );
}
