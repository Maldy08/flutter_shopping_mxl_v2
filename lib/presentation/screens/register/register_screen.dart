import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const String name = "register_screen";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sign Up'),
      backgroundColor: AppTheme.getBackgroundContainerColor(),
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                  width: 100,
                  height: 100,
                  //padding: const EdgeInsets.all(30),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.black38,
                    size: 100,
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 600,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.all(30),
                child: Form(
                    child: ListView(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: bgContainer,
                        labelText: 'Nombre Completo',
                        border: OutlineInputBorder(
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: bgContainer,
                        labelText: 'Edad',
                        border: OutlineInputBorder(
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
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: bgContainer,
                        labelText: 'Sexo',
                        border: OutlineInputBorder(
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: bgContainer,
                        labelText: 'Correo',
                        border: OutlineInputBorder(
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: bgContainer,
                        labelText: 'Telefono',
                        border: OutlineInputBorder(
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
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: bgContainer,
                        labelText: 'Codigo Postal',
                        border: OutlineInputBorder(
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
                    CustomElevatedButton(
                        func: () {},
                        label: 'Crear Cuenta',
                        color: Colors.orange),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        const Text('Ya tienes cuenta?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login-page');
                            },
                            child: const Text('Inicia sesión'))
                      ],
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
