import 'package:flutter/material.dart';

class TextBanner extends StatelessWidget {
  const TextBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        "assets/images/banner.png",
        scale: 4.0,
      ),
    );
    // return Container(
    //   margin: EdgeInsets.only(
    //     left: MediaQuery.of(context).size.width * 0.1,
    //     top: MediaQuery.of(context).size.height * 0.04,
    //     bottom: MediaQuery.of(context).size.height * 0.04,
    //   ),
    //   child:
    //       const Text("Order online\ncollect in abc", style: kBannerTextStyle),
    // );
  }
}
