import 'package:flutter/material.dart';
import 'package:my_first_package/my_first_package.dart';
import 'package:my_first_package/walkthrough.dart';

class TestScreen extends StatelessWidget {
  final List<Walkthrough> list = [
    Walkthrough(
      title: "Title 1",
      content: "Content 1",
      imageIcon: Icons.mobile_screen_share,
    ),
    Walkthrough(
      title: "Title 2",
      content: "Content 2",
      imageIcon: Icons.search,
    ),
    Walkthrough(
      title: "TItle 3",
      content: "Content 3",
      imageIcon: Icons.shopping_cart,
    ),
    Walkthrough(
      title: "Title 4",
      content: "COntent 4",
      imageIcon: Icons.verified_user,
    ),
  ];

  TestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroScreen(
        walkthroughList: list,
        pageRoute: MaterialPageRoute(builder: (context) => TestScreen()));
  }
}
