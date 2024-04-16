// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cinesmaracaibo/models/auth/auth.dart';
import 'package:cinesmaracaibo/models/provider/trabajador_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/usuarios/trabajador.dart';
import '../../login/login_page.dart';

class HomeController {
  late BuildContext context;
  late Function refresh;
  FirebaseFirestore db = FirebaseFirestore.instance;

  late AuthAppProvider _authAppProvider;
  late TrabajadorProvider _trabajadorProvider;

  Trabajador? trabajador;

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

  Future<List> carteleraGetAll() async {
    List item = [];
    CollectionReference collectionReferenceDriver = db.collection('peliculas');

    QuerySnapshot queryItem = await collectionReferenceDriver.get();

    queryItem.docs.forEach((document) {
      item.add(document.data());
    });

    await Future.delayed(const Duration(seconds: 1));

    return item;
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, LoginPage.routeName);
    refresh();
  }
}
