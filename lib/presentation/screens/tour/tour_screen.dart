import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/tour/pages/page_1.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/tour/pages/page_2.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/tour/pages/page_3.dart';

class TourScreen extends StatefulWidget {
  const TourScreen({super.key});
  static const String name = "tour_screen";

  @override
  State<TourScreen> createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 200,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Indicator(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 1,
                  currentIndex: currentIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        onTap: () => previousFunction(),
                        child: Text("Previous")),
                    const SizedBox(
                      width: 50,
                    ),
                    InkWell(onTap: () => nextFunction(), child: Text("Next"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({super.key, this.currentIndex = 1, this.positionIndex = 1});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          color:
              positionIndex == currentIndex ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
