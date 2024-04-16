// ignore_for_file: unused_field, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/provider/trabajador_provider.dart';
import '../detalle_empleado_page.dart';

class EmpleadosController {
  late BuildContext context;
  late Function refresh;
  FirebaseFirestore db = FirebaseFirestore.instance;

  late TrabajadorProvider _trabajadorProvider;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _trabajadorProvider = TrabajadorProvider();

    refresh();
  }

  Future<List> getAll() async {
    List item = [];
    CollectionReference collectionReferenceDriver =
        db.collection('trabajadores');

    QuerySnapshot queryItem = await collectionReferenceDriver.get();

    queryItem.docs.forEach((document) {
      item.add(document.data());
    });

    await Future.delayed(const Duration(seconds: 1));

    return item;
  }

  void goToDetalleEmpleados(String id) {
    Navigator.pushNamed(context, DetalleEmpleadoPage.routeName, arguments: id);
  }
}
