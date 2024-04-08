import 'package:flutter/material.dart';
import 'package:new_walkthrough/my_first_package.dart';
import 'package:new_walkthrough/walkthrough.dart';

class TestScreen extends StatelessWidget {
  final List<Walkthrough> list = const [
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

  const TestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroScreen(
        walkthroughList: list,
        pageRoute: MaterialPageRoute(builder: (context) => const TestScreen()));
  }
}
