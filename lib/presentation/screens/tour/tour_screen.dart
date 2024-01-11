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
    _pageController = PageController(
      keepPage: true,
      viewportFraction: 1,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onNextPage() {
    if (_activePage < viewRoutes.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  final viewRoutes = const <Widget>[
    Page1(),
    Page2(),
    Page3(),
  ];

  late PageController _pageController = PageController();

  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: viewRoutes,
              onPageChanged: (value) {
                setState(() {
                  _activePage = value;
                });
              },
            )),
      ),
    );
  }
}
