import 'package:flutter/material.dart';
import '/config/theme/app_theme.dart';

class HomeSearchButtons extends StatelessWidget {
  const HomeSearchButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final buttonStyle = OutlinedButton.styleFrom(
    //     shape: const RoundedRectangleBorder(),
    //     side: BorderSide(color: theme.primaryColor));

    const textStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding:
              const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/supermarket.png',
                        fit: BoxFit.cover,
                      ),
                      style: AppTheme.iconButton(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Mercados',
                      style: textStyle,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/restaurant.png',
                        fit: BoxFit.cover,
                      ),
                      style: AppTheme.iconButton(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Restaurantes',
                      style: textStyle,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/makeover.png',
                        fit: BoxFit.cover,
                      ),
                      style: AppTheme.iconButton(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Esteticas',
                      style: textStyle,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/pharmacy.png',
                        fit: BoxFit.cover,
                      ),
                      style: AppTheme.iconButton(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Farmacias',
                      style: textStyle,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/barbershop.png',
                        fit: BoxFit.cover,
                      ),
                      style: AppTheme.iconButton(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Barberias',
                      style: textStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
