import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

Widget emailField(BuildContext context, TextEditingController _emailController,
    dynamic validateEmail) {
  return SizedBox(
    // height: 50,
    child: TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 17),
      controller: _emailController,
      // obscureText: true,
      // enableSuggestions: false,
      // autocorrect: false,
      decoration: InputDecoration(
        // errorText: '${BlocProvider.of<AuthBloc>(context).state.exception}',
        errorStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // contentPadding: EdgeInsets.only(top: 20, bottom: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 97, 97, 97))),
        fillColor: Color.fromARGB(110, 22, 21, 21),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)),
        // labelText: 'Password',
      ),
      validator: validateEmail,
    ),
  );
}

Widget userNameField(BuildContext context,
    TextEditingController _userNameController, dynamic validateUserName) {
  return SizedBox(
    // height: 50,
    child: TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 17),
      controller: _userNameController,
      // obscureText: true,
      // enableSuggestions: false,
      // autocorrect: false,
      decoration: InputDecoration(
        // errorText: '${BlocProvider.of<AuthBloc>(context).state.exception}',
        errorStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // contentPadding: EdgeInsets.only(top: 20, bottom: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 97, 97, 97))),
        fillColor: Color.fromARGB(110, 22, 21, 21),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)),
        // labelText: 'Password',
      ),
      validator: validateUserName,
    ),
  );
}

Widget passwordField(BuildContext context,
    TextEditingController _passwordController, dynamic validatePassword) {
  return SizedBox(
    // height: 50,
    child: TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 17),
      controller: _passwordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        // errorText: '${BlocProvider.of<AuthBloc>(context).state.exception}',
        errorStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // contentPadding: EdgeInsets.only(top: 20, bottom: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 97, 97, 97))),
        fillColor: Color.fromARGB(110, 22, 21, 21),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)),
        // labelText: 'Password',
      ),
      validator: validatePassword,
    ),
  );
}

Widget passwordAgainField(
    BuildContext context, TextEditingController _passwordAgainController) {
  return SizedBox(
    // height: 50,
    child: TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 17),
      controller: _passwordAgainController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // contentPadding: EdgeInsets.only(top: 20, bottom: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 97, 97, 97))),
        fillColor: Color.fromARGB(110, 22, 21, 21),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)),
        // labelText: 'Password',
      ),
      // validator: validatePassword,
    ),
  );
}
