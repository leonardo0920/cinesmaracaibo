import 'package:cinesmaracaibo/models/provider/trabajador_provider.dart';
import 'package:cinesmaracaibo/models/usuarios/trabajador.dart';
import 'package:flutter/material.dart';

import '../empleados_edit_page.dart';

class DetalleEmpleadosController {
  late BuildContext context;
  late Function refresh;

  late TrabajadorProvider _trabajadorProvider;
  Trabajador? trabajador;

  late String idWorker;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _trabajadorProvider = TrabajadorProvider();

    idWorker = ModalRoute.of(context)!.settings.arguments as String;

    getWorkerInfo();
    refresh();
  }

  void getWorkerInfo() async {
    trabajador = await _trabajadorProvider.getById(idWorker);
    refresh();
  }

  void deleteUser(String id) {
    if (trabajador!.admin == true) {
      Navigator.pop(context);
      alertButton();
    } else {
      _trabajadorProvider.delete(id);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Se ha Eliminado el Empleado Correctamente"),
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

  void goToEmpleados(String id) {
    Navigator.pushNamed(context, EmpleadoEditPage.routeName, arguments: id);
  }

  void alertButton() {
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: const Text(
            "Este Usuario no puede Eliminarse",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          content: const Text(
            "Este usuario Es administrado y no puede Eliminarse",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            Center(
              child: SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Volver',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (12.0),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
