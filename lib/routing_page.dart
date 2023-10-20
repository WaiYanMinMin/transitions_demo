import 'package:animation_demo/core/constants/color.dart';
import 'package:animation_demo/core/model/nav_items.dart';
import 'package:animation_demo/modules/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class RoutingPage extends StatefulWidget {
  const RoutingPage({super.key});

  @override
  State<RoutingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  int selectedBottomNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: const HomePage(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
            ),
            ...List.generate(
              navItems.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedBottomNav = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      margin: const EdgeInsets.only(bottom: 2),
                      height: 4,
                      width: index == selectedBottomNav ? 20 : 0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: AnimatedOpacity(
                        opacity: index == selectedBottomNav ? 1 : 0.5,
                        duration: const Duration(milliseconds: 350),
                        child: navItems[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
