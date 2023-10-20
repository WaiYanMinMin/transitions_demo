import 'package:animation_demo/core/constants/color.dart';
import 'package:animation_demo/modules/landing/widgets/animated_contents.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
        ),
        builder: (_) => const AnimatedContent(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            stops: [0.15, 1],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              secondaryColor,
              primaryColor,
            ]),
      ),
    ));
  }
}
