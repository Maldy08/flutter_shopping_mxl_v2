import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/router/app_router.dart';

import 'package:flutter_shopping_mxl_v2/presentation/screens/tour/pages/page_1.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/tour/pages/page_2.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/tour/pages/page_3.dart';
import 'package:flutter_shopping_mxl_v2/presentation/shared_preferences_test.dart';

import 'package:go_router/go_router.dart';

class TourScreen extends StatefulWidget {
  TourScreen({super.key});
  static const String name = "tour_screen";
  final prefs = SharedPreferencesTest();

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

  startFunction() {
    prefs.setFirstTimeUse(false);
    context.go('/login');
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
            onPageChanged: onChangedFunction,
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 180,
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
            left: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                      onPressed: previousFunction, child: const Text('Atras')),
                  const SizedBox(
                    width: 50,
                  ),
                  currentIndex == 2
                      ? TextButton(
                          onPressed: startFunction,
                          child: const Text('Empezar'))
                      : TextButton(
                          onPressed: nextFunction,
                          child: const Text('Siguiente'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int _positionIndex, _currentIndex;
  const Indicator({super.key, int? positionIndex, int? currentIndex})
      : _currentIndex = currentIndex ?? 0,
        _positionIndex = positionIndex ?? 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          color: _positionIndex == _currentIndex
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
