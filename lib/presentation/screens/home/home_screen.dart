import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/home/widgets/home_search_buttons.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/images_backgroud.dart';

const cards = <Map<String, dynamic>>[
  {
    'elevation': 0.0,
    'title': 'Larguchonas',
    'image': 'assets/images/larguchonas.jpg'
  },
  {'elevation': 0.0, 'title': 'Carls Jr', 'image': 'assets/images/carlsjr.jpg'},
  {
    'elevation': 0.0,
    'title': 'Hamburguesa',
    'image': 'assets/images/hamb.jpeg'
  },
  {
    'elevation': 0.0,
    'title': 'Elevation 0',
    'image': 'assets/images/larguchonas.jpg'
  },
  {
    'elevation': 0.0,
    'title': 'Elevation 0',
    'image': 'assets/images/larguchonas.jpg'
  },
  {
    'elevation': 0.0,
    'title': 'Elevation 0',
    'image': 'assets/images/larguchonas.jpg'
  },
  {
    'elevation': 0.0,
    'title': 'Elevation 0',
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
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'assets/images/app-logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.account_circle_rounded),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Hola,',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    ' Usuario.',
                    style: TextStyle(fontSize: 18, color: theme.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    label: const Text(
                      'Buscar Negocio o Producto',
                    ),
                    style: const ButtonStyle(
                        alignment: AlignmentDirectional.centerStart,
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                  )),
                ],
              ),
              const HomeSearchButtons(),
            ],
          ),
        ),
      )),
      bottomNavigationBar: NavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        //surfaceTintColor: Colors.white,

        onDestinationSelected: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(
              Icons.home_outlined,
              size: size,
            ),
            label: 'Home',
            selectedIcon: Icon(
              Icons.home,
              size: size,
              color: theme.primaryColor,
            ),
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.search,
              size: size,
            ),
            label: 'Search',
            selectedIcon: Icon(
              Icons.search_outlined,
              size: size,
              color: theme.primaryColor,
            ),
          ),
          NavigationDestination(
              icon: const Icon(
                Icons.favorite_outline,
                size: size,
              ),
              label: 'Favorites',
              selectedIcon: Icon(
                Icons.favorite,
                size: size,
                color: theme.primaryColor,
              )),
          NavigationDestination(
            icon: const Icon(
              Icons.settings_applications_outlined,
              size: size,
            ),
            label: 'Settings',
            selectedIcon: Icon(
              Icons.settings_applications,
              size: size,
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
