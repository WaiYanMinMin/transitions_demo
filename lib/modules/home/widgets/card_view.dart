import 'package:animation_demo/core/model/camp_model.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.75);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: demoCampData.length,
        itemBuilder: (context, index) {
          // double offset = pageOffset - index;

          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double pageOffset = 0;
              if (pageController.position.haveDimensions) {
                pageOffset = pageController.page! - index;
              }
              double gauss =
                  math.exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));
              return Transform.translate(
                offset: Offset(-20 * gauss * pageOffset.sign, 0),
                child: Container(
                  clipBehavior: Clip.none,
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(8, 20),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      // Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(32),
                            top: Radius.circular(32)),
                        child: Image.asset(
                          'assets/images/${demoCampData[index].image}',
                          height: MediaQuery.of(context).size.height * 0.7,
                          alignment: Alignment(-pageOffset.abs(), 0),
                          fit: BoxFit.none,
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Column(
                            children: [
                              Text(demoCampData[index].name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(demoCampData[index].location,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
