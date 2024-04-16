// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/provider/trabajador_provider.dart';
import '../../../models/usuarios/trabajador.dart';

class EmpleadosEditController {
  late BuildContext context;
  late Function refresh;

  late TrabajadorProvider _trabajadorProvider;
  Trabajador? worker;

  late String idWorker;

  String? nombre;
  String? apellido;
  String? cedula;
  String? correo;

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController cedulaController = TextEditingController();
  TextEditingController correoController = TextEditingController();

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _trabajadorProvider = TrabajadorProvider();

    idWorker = ModalRoute.of(context)!.settings.arguments as String;

    getWorkerInfo();
    refresh();
  }

  void getWorkerInfo() async {
    Stream<DocumentSnapshot> userStream =
        _trabajadorProvider.getByIdStream(idWorker);
    userStream.listen(
      (DocumentSnapshot document) {
        worker = Trabajador.fromJson(document.data() as Map<String, dynamic>);
        refresh();
      },
    );
    refresh();
  }

  Future<void> update(String id) async {
    if (nombreController.text != '') {
      nombre = nombreController.text;
    } else {
      nombre = worker!.nombre;
    }

    if (apellidoController.text != '') {
      apellido = apellidoController.text;
    } else {
      apellido = worker!.apellido;
    }

    if (cedulaController.text != '') {
      cedula = cedulaController.text;
    } else {
      cedula = worker!.ci;
    }

    if (correoController.text != '') {
      correo = correoController.text;
    } else {
      correo = worker!.correo;
    }
    Map<String, dynamic> data = {
      'nombre': nombre,
      'apellido': apellido,
      'ci': cedula,
      'correo': correo,
    };

    await _trabajadorProvider.update(data, id);

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Se han actualizado los datos del Empleado"),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
    refresh();
  }
}
