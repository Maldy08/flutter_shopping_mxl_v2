import 'package:flutter/material.dart';

import '../screens/home/widgets/home_search_buttons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final theme = Theme.of(context);

    return SingleChildScrollView(
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
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/app-logo-mini.png',
                      fit: BoxFit.fitWidth,
                    ),
                    onTap: () => scaffoldKey.currentState?.openDrawer(),
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
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                )),
              ],
            ),
            const HomeSearchButtons(),
          ],
        ),
      ),
    );
  }
}
