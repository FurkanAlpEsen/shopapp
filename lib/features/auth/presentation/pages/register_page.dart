import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopapp/features/auth/presentation/mixin/validation_mixin.dart';

import '../../../../injection_container.dart';
import '../../../home/presentation/pages/home.dart';
import '../../domain/entities/user_entity.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/register_fields.dart';

class RegisterPage extends StatelessWidget with ValidationMixin {
  RegisterPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  late UserEntity userEntity = new UserEntity(1, _userNameController.text,
      _emailController.text, _passwordAgainController.text);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          AuthState(
              entity: UserEntity(1, _userNameController.text,
                  _emailController.text, _passwordController.text),
              exception: ''),
          sl(),
          sl()),
      child: Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 67, 67, 67), BlendMode.plus),
                  child: Image.asset(
                    'assets/images/register.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Image.asset(
                  'assets/images/backfoto.png',
                  fit: BoxFit.fill,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Color.fromARGB(35, 55, 54, 54), BlendMode.modulate),
                    child: Image.asset(
                      'assets/images/market.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 100, child: _buildColumn(context))
              ],
            )),
      ),
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'E - Posta Adresi',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            emailField(context, _emailController, validateEmail),
            SizedBox(
              height: 10,
            ),
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
              height: 10,
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Sifre Tekrar',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            passwordAgainField(context, _passwordAgainController),
            SizedBox(
              height: 10,
            ),
            registerButton(context)
          ],
        ),
      ),
    );
  }

  Widget registerButton(BuildContext context) {
    late UserEntity userEntity = new UserEntity(1, _userNameController.text,
        _emailController.text, _passwordController.text);
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
                ..add(RegisterEvent(userEntity));

              // print('user $userEntity');

              // print('state type: --- ${state}');

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
          child: const Text(
            'Kayit Ol',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
