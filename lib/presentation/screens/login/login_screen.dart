import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String name = "login_screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Sign in',
      ),
      backgroundColor: AppTheme.getBackgroundContainerColor(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/login-image.png',
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 260,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  padding: const EdgeInsets.all(30),
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration:  InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: theme.primaryColor,
                          ),
                          filled: true,
                          fillColor: bgContainer,
                          labelText: 'Correo',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration:  InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: theme.primaryColor,
                          ),
                          filled: true,
                          fillColor: bgContainer,
                          labelText: 'Password',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                            func: () {},
                            label: 'Iniciar sesión',
                            color: Colors.orange),
                      )
                    ],
                  )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    '-o inicia sesión con-',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                  Container(
                    padding: const EdgeInsets.all(0.5),
                    child: IconButton(
                      onPressed: (){},
                      icon: Image.asset('assets/images/Icon_Google.png',height: 40, width: 40,),
                     ),
                     
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.5),
                    child: IconButton(
                      onPressed: (){},
                      icon: Image.asset('assets/images/Icon_facebook.png',height: 40, width: 40,),
                     ),
                     
                  ),
                  
                ],)
    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
