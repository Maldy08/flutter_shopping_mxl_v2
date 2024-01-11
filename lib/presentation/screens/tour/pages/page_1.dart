import 'package:flutter/widgets.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 1'),
    );
  }
}


//  Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/onboarding-1.png',
//                   fit: BoxFit.contain,
//                   width: 350,
//                   height: 350,
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Bienvenido a EnOfferta',
//                   style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.black,
//                       fontFamily: 'Roboto',
//                       decoration: TextDecoration.none,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Donde podrás encontrar cupones y descuentos de comercios de la localidad.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black45,
//                       fontFamily: 'Roboto',
//                       decoration: TextDecoration.none,
//                       fontWeight: FontWeight.normal),
//                 ),
//                 const SizedBox(height: 20),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       const Spacer(),
//                       CustomElevatedButton(
//                         label: 'Siguiente',
//                         func: () {},
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),