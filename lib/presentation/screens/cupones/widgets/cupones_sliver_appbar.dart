import 'package:flutter/material.dart';
import '/infrastructure/models/cupones.dart';

class CuponesSliverAppBar extends StatelessWidget {
  final Cupones cupon;

  const CuponesSliverAppBar({super.key, required this.cupon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.30,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/images/cupon.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.7, 1.0],
                        colors: [Colors.transparent, Colors.black87])),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        //end: Alignment.bottomCenter,
                        stops: [0.0, 0.3],
                        colors: [Colors.black87, Colors.transparent])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
