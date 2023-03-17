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

    final textStyle = TextStyle(fontSize: 12);

    return Column(
      children: [
        SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/supermarket.png',
                      fit: BoxFit.cover,
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
