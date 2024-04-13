// ignore_for_file: avoid_print

import 'package:cinesmaracaibo/models/provider/trabajador_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/auth/auth.dart';
import '../../../models/usuarios/trabajador.dart';
import '../../login/login_page.dart';

class HomeController {
  late BuildContext context;
  late Function refresh;

  late AuthAppProvider _authAppProvider;
  late TrabajadorProvider _trabajadorProvider;

  Trabajador? trabajador;

  TextEditingController ciController = TextEditingController();

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _authAppProvider = AuthAppProvider();
    _trabajadorProvider = TrabajadorProvider();

    getUserInfo();
  }

  void dispose() {}

  void getUserInfo() async {
    trabajador =
        await _trabajadorProvider.getById(_authAppProvider.getUser()!.uid);
    refresh();
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, LoginPage.routeName);
    refresh();
  }
}
