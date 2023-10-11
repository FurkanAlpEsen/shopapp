import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/auth/domain/entities/user_entity.dart';
import 'package:shopapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopapp/features/home/presentation/pages/home.dart';
import 'package:shopapp/features/auth/presentation/pages/register_page.dart';

import '../mixin/validation_mixin.dart';
import '../widgets/login_fields.dart';

class LoginPage extends StatelessWidget with ValidationMixin {
  LoginPage({super.key});

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/backfoto2.png',
                fit: BoxFit.fill,
              ),
              Image.asset(
                'assets/images/backfoto.png',
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(92, 27, 26, 26), BlendMode.modulate),
                  child: Image.asset(
                    'assets/images/market.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              buildColumn()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColumn() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Kullanici Adi',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                userNameField(context, _userNameController, validateUserName),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Sifre',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                passwordField(context, _passwordController, validatePassword),
                SizedBox(
                  height: 20,
                ),
                submitButton(context),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hesabiniz yok mu?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return RegisterPage();
                            },
                          ));
                        },
                        child: Text(
                          'Hesap Olustur',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // _buildErrorBar() {
  // Widget userNameField() {
  //   return TextFormField(
  //     controller: _userNameController,
  //     decoration: InputDecoration(labelText: 'User Name'),
  //     validator: validateUserName,
  //   );
  // }

  Widget submitButton(BuildContext context) {
    late UserEntity userEntity = new UserEntity(
        1, _userNameController.text, 'email', _passwordController.text);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 20)),
              backgroundColor: MaterialStatePropertyAll(Colors.red.shade300)),
          onPressed: () async {
            // final state = context.read<AuthBloc>().state;

            // print('------user entity $state ');

            // ScaffoldMessenger.of(context).showSnackBar(_buildErrorBar());
            // if (state is AuthError) {
            //   // return snackBar;
            //   print('loogin exc------ ${state.exception}');
            // }
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();

              await context.read<AuthBloc>()
                ..add(LoginEvent(userEntity));

              // print('user $userEntity');

              // print('state type: --- ${state}');
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return Home();
              //   },
              // ));

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                  (route) => false);
              // if (state is AuthError) {
              //   print('error de girmiyo lan');
              // }

              // if (state is AuthDone) {
              //   Navigator.push(context, MaterialPageRoute(
              //     builder: (context) {
              //       return Home();
              //     },
              //   ));
              // }
            }
          },
          child: const Text('Giris Yap'),
        );
      },
    );
  }
}
