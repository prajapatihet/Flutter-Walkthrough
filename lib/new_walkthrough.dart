// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  final title;
  final content;
  final imageIcon;
  final imageColor;
  const Walkthrough({
    super.key,
    this.title,
    this.content,
    this.imageIcon,
    this.imageColor = Colors.redAccent,
  });

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

/// It is used to show the walkthrough page with a text
class _WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween(begin: -250.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    animation.addListener(() {});

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        animationDuration: const Duration(milliseconds: 500),
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(widget.content,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.black)),
            ),
            Icon(
              widget.imageIcon,
              size: 100.0,
              color: widget.imageColor,
            )
          ],
        ),
      ),
    );
  }
}
