import 'package:flutter/material.dart';

class HomeSearchButtons extends StatelessWidget {
  const HomeSearchButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        side: BorderSide(color: theme.primaryColor));

    return Column(
      children: [
        SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 10,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Mercados')));
                },
                icon: const Icon(Icons.shopping_bag),
                label: const Text('Mercados'),
                style: buttonStyle,
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.restaurant),
                label: const Text('Restaurantes'),
                style: buttonStyle,
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.cut),
                label: const Text('Esteticas'),
                style: buttonStyle,
              ),
              // OutlinedButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(Icons.shopping_bag),
              //   label: const Text('Mercados'),
              //   style: buttonStyle,
              // ),
              // OutlinedButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(Icons.shopping_bag),
              //   label: const Text('Mercados'),
              //   style: buttonStyle,
              // ),
              // OutlinedButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(Icons.shopping_bag),
              //   label: const Text('Mercados'),
              //   style: buttonStyle,
              // ),
            ],
          ),
        )
      ],
    );
  }
}
