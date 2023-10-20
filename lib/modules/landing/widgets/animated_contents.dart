import 'package:animation_demo/core/constants/color.dart';
import 'package:animation_demo/core/route/route_extension.dart';
import 'package:animation_demo/modules/landing/widgets/get_started.dart';
import 'package:animation_demo/modules/landing/widgets/login_widget.dart';
import 'package:animation_demo/routing_page.dart';
import 'package:flutter/material.dart';

class AnimatedContent extends StatefulWidget {
  const AnimatedContent({super.key});

  @override
  State<AnimatedContent> createState() => _AnimatedContentState();
}

class _AnimatedContentState extends State<AnimatedContent> {
  late PageController _pageController;
  // double _progress;
  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        _pageController.hasClients ? (_pageController.page ?? 0) : 0;

    return SizedBox(
      height: 400 + progress * 140,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: const [
                    GetStartedWidget(),
                    LoginWidget(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            height: 56,
            bottom: 32 + progress * 140,
            right: 16,
            child: GestureDetector(
              onTap: () {
                if (_pageController.page == 0) {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.ease);
                }
                if (_pageController.page == 1) {
                  context.pushReplaceMent(RoutingPage());
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                      stops: [0.15, 1],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        secondaryColor,
                        primaryColor,
                      ]),
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 92 + progress * 32,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Opacity(
                              opacity: 1 - progress,
                              child: const Text("Get Started"),
                            ),
                            Opacity(
                              opacity: progress,
                              child: const Text(
                                "Continue",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
