// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cinesmaracaibo/models/auth/auth.dart';
import 'package:cinesmaracaibo/models/provider/horario_provider.dart';
import 'package:cinesmaracaibo/models/provider/trabajador_provider.dart';
import 'package:cinesmaracaibo/screen/horario/agregar_horario_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/usuarios/trabajador.dart';
import '../../login/login_page.dart';
import '../../peliculas/detalle_peliculas_page.dart';

class HomeController {
  late BuildContext context;
  late Function refresh;
  FirebaseFirestore db = FirebaseFirestore.instance;

  late AuthAppProvider _authAppProvider;
  late TrabajadorProvider _trabajadorProvider;
  late HorarioProvider _horarioProvider;

  Trabajador? trabajador;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _authAppProvider = AuthAppProvider();
    _trabajadorProvider = TrabajadorProvider();
    _horarioProvider = HorarioProvider();

    getUserInfo();
  }

  void dispose() {}

  void getUserInfo() async {
    trabajador =
        await _trabajadorProvider.getById(_authAppProvider.getUser()!.uid);
    refresh();
  }

  void goToDetallePelicula(String id) {
    Navigator.pushNamed(context, DetallePeliculaPage.routeName, arguments: id);
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

  Future<List> horarioGetAll() async {
    List item = [];
    CollectionReference collectionReferenceDriver = db.collection('horario');

    QuerySnapshot queryItem = await collectionReferenceDriver.get();

    queryItem.docs.forEach((document) {
      item.add(document.data());
    });

    await Future.delayed(const Duration(seconds: 1));

    return item;
  }

  void addHorario() {
    Navigator.pushNamed(context, AgregarHorarioPage.routeName);
  }

  void deleteHorario(String id) async {
    await _horarioProvider.delete(id);
    print('Se ha eliminado');
    refresh();
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, LoginPage.routeName);
    refresh();
  }
}
