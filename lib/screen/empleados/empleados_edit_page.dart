import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'controller/empleado_edit_controller.dart';

class EmpleadoEditPage extends StatefulWidget {
  static String routeName = "/empleados_form_page";

  const EmpleadoEditPage({super.key});
  @override
  State<EmpleadoEditPage> createState() => _EmpleadoEditPageState();
}

class _EmpleadoEditPageState extends State<EmpleadoEditPage> {
  final EmpleadosEditController _con = EmpleadosEditController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Empleados',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Datos Personales',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              buildNombreFormField(),
              const SizedBox(height: 15),
              buildCedulaFormField(),
              const SizedBox(height: 15),
              buildCorreoFormField(),
              const SizedBox(height: 45),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        alertButton();
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF006D85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Editar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void alertButton() {
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: const Text(
            "Editar",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          content: const Text(
            "Esta seguro que desea Editar este perfil",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
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
                    backgroundColor: Colors.grey[600],
                  ),
                  onPressed: () {
                    _con.update(_con.idWorker);
                  },
                  child: const Text(
                    'Si',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text(
                  "No",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  TextFormField buildNombreFormField() {
    return TextFormField(
      // enabled: false,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Nombre Completo",
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   ${_con.worker?.nombre} ${_con.worker?.apellido}",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField buildCedulaFormField() {
    return TextFormField(
      // enabled: false,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Cedula",
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   ${_con.worker?.ci}",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField buildCorreoFormField() {
    return TextFormField(
      // enabled: false,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Correo Electronico",
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   ${_con.worker?.correo}",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
