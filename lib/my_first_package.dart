library my_first_package;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_walkthrough/walkthrough.dart';

/// A Calculator.
class IntroScreen extends StatefulWidget {
  final List<Walkthrough> walkthroughList;
  final MaterialPageRoute pageRoute;
  IntroScreen({
    super.key,
    required this.walkthroughList,
    required this.pageRoute,
  });

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.walkthroughList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: widget.walkthroughList,
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                CupertinoButton(
                  child: Text(lastPage ? "" : "SKIP",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage ? null : widget.skipPage(context),
                ),
                CupertinoButton(
                  child: Text(lastPage ? "GOT IT" : "NEXT",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? widget.skipPage(context)
                      : controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
