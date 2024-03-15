import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/negocios/search_negocios_delegate.dart';

import '../../blocs/blocs.dart';

class HeaderOfertas extends StatelessWidget {
  const HeaderOfertas({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SizedBox(
        height: height * 0.25,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Image.asset('assets/images/app-logo-white.png'),
            ),
            const SizedBox(height: 5),
            const Text(
              'EnOfferta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Ofertas',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Descubre las ofertas en tu ciudad!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 250,
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: theme.primaryColor,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Buscar',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onTap: () async {
                          await showSearch(
                            context: context,
                            delegate: SearchNegociosDelegate(
                                context.read<NegociosBloc>().state.negocios),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/afiliadosldpi.png',
                    width: 110,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
