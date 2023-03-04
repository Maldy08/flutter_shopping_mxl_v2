import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/images_backgroud.dart';

const cards = <Map<String, dynamic>>[
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
    'image': 'assets/images/larguchonas.jpg'
  },
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
    'image': 'assets/images/carlsjr.jpg'
  },
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
    'image': 'assets/images/hamb.jpeg'
  },
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
    'image': 'assets/images/larguchonas.jpg'
  },
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
    'image': 'assets/images/larguchonas.jpg'
  },
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
    'image': 'assets/images/larguchonas.jpg'
  },
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
    'image': 'assets/images/larguchonas.jpg'
  },
];

class HomeScreen extends StatefulWidget {
  static const String name = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  static const double size = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.getBackgroundContainerColor(),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: NavigationBar(
        height: 80,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        //surfaceTintColor: Colors.white,

        onDestinationSelected: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              size: size,
            ),
            label: 'Home',
            selectedIcon: Icon(
              Icons.home,
              size: size,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search,
              size: size,
            ),
            label: 'Search',
          ),
          NavigationDestination(
              icon: Icon(
                Icons.star_outline,
                size: size,
              ),
              label: 'Favorites',
              selectedIcon: Icon(
                Icons.star,
                size: size,
              )),
          NavigationDestination(
            icon: Icon(
              Icons.account_box_outlined,
              size: size,
            ),
            label: 'User',
            selectedIcon: Icon(
              Icons.account_box,
              size: size,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings_applications_outlined,
              size: size,
            ),
            label: 'Settings',
            selectedIcon: Icon(
              Icons.settings_applications,
              size: size,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (currentPageIndex) {
      case 0:
        return SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      ...cards.map(
                        (card) => _CardType4(
                          elevation: card['elevation'],
                          label: card['label'],
                          imageUrl: card['image'],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      case 1:
        return const Center(child: Text('Search'));
      case 2:
        return const Center(child: Text('Favorites'));
      case 3:
        return const Center(child: Text('User'));
      case 4:
        return const Center(child: Text('Settings'));
      default:
        return const Center(child: Text('Default'));
    }
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;
  final String imageUrl;

  const _CardType4(
      {required this.label, required this.elevation, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: Colors.orange,
      child: Row(
        children: [
          Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: IconButton(
                        icon: const Icon(Icons.star_outline_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),

                  // const SizedBox(height: 200, child: Placeholder()),
                  // ImageBackground(
                  //   stops: const [0.3, 1.0],
                  // ),
                  // Image.asset(
                  //   imageUrl,
                  //   height: 200,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Container(
                  //     decoration: const BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius:
                  //             BorderRadius.only(bottomLeft: Radius.circular(20))),
                  //     child: IconButton(
                  //       icon: const Icon(Icons.star_outline_rounded),
                  //       onPressed: () {},
                  //     ),
                  //   ),
                  // ),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       const Text(
                  //         'TITULO',
                  //         style: TextStyle(color: Colors.white, fontSize: 20),
                  //       ),
                  //       const Text('TITULO')
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
