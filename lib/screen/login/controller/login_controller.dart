// ignore_for_file: use_build_context_synchronously

import 'package:cinesmaracaibo/models/auth/auth.dart';
import 'package:cinesmaracaibo/models/provider/trabajador_provider.dart';
import 'package:cinesmaracaibo/models/usuarios/trabajador.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../home/home_page.dart';

class LoginController {
  late BuildContext context;
  late Function refresh;

  String? email;
  String? password;

  late AuthAppProvider _authAppProvider;
  late TrabajadorProvider _trabajadorProvider;

  final user = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _authAppProvider = AuthAppProvider();
    _trabajadorProvider = TrabajadorProvider();

    refresh();
  }

  void dispose() {}

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      bool isLogin = await _authAppProvider.login(email, password);
      if (isLogin) {
        if (user.currentUser != null) {
          Trabajador? trabajador = await _trabajadorProvider
              .getById(_authAppProvider.getUser()!.uid);
          if (trabajador != null) {
            Navigator.pushNamed(context, HomePage.routeName);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("The user is logged"),
                backgroundColor: Color(0xFF36499B),
                elevation: 10,
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email or password is wrong"),
              backgroundColor: Color(0xFF36499B),
              elevation: 10,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("the user cannot be authenticated"),
            backgroundColor: Color(0xFF36499B),
            elevation: 10,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          backgroundColor: const Color(0xFF36499B),
          elevation: 10,
        ),
      );
    }
  }
}
