// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../models/provider/trabajador_provider.dart';
import '../../../models/usuarios/trabajador.dart';

class NuevoEmpleadoController {
  late BuildContext context;
  late Function refresh;

  late TrabajadorProvider _trabajadorProvider;
  Trabajador? trabajador;

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController cedulaController = TextEditingController();
  TextEditingController correoController = TextEditingController();

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _trabajadorProvider = TrabajadorProvider();

    refresh();
  }

  void nuevoEmpleado() async {
    if (nombreController.text != '' &&
        apellidoController.text != '' &&
        cedulaController.text != '' &&
        correoController.text != '') {
      Trabajador data = Trabajador(
        nombre: nombreController.text,
        apellido: apellidoController.text,
        ci: cedulaController.text,
        correo: cedulaController.text,
      );

      await _trabajadorProvider.create(data);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("El usuario se a creado Correctamente"),
          backgroundColor: Colors.white,
          elevation: 10,
        ),
      );

      Future.delayed(Duration(seconds: 1), () {
        Navigator.pop(context);
        refresh();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Llene todas las casilla por favor"),
          backgroundColor: Colors.white,
          elevation: 10,
        ),
      );
    }
  }
}
