import 'package:flutter/material.dart';

extension RouteExtension on BuildContext {
  void push(Widget nextPage) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );
  }

  void pushReplaceMent(Widget nextPage) {
    Navigator.pushReplacement(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return nextPage;
        },
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation1, animation2, child) {
          animation1 = CurvedAnimation(
            curve: Curves.easeInOut,
            parent: animation1,
          );
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ).animate(animation1),
            child: child,
          );
        },
      ),
    );
  }

  void pop() {
    Navigator.pop(this);
  }

  void popHome() {
    Navigator.popUntil(this, (route) => route.isFirst);
  }
}
