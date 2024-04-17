// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

import 'controller/detalle_empleado_controller.dart';

class DetalleEmpleadoPage extends StatefulWidget {
  static String routeName = "/empleados_detalle_page";

  const DetalleEmpleadoPage({super.key});
  @override
  State<DetalleEmpleadoPage> createState() => _DetalleEmpleadoPageState();
}

class _DetalleEmpleadoPageState extends State<DetalleEmpleadoPage> {
  final DetalleEmpleadosController _con = DetalleEmpleadosController();

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
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SvgPicture.asset(
                  "assets/icon/user.svg",
                  color: Colors.white,
                ),
              ),
              Text(
                '${_con.trabajador?.nombre ?? ""} ${_con.trabajador?.apellido ?? ''}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              _con.trabajador?.admin == true
                  ? const Text(
                      'Admin',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : const Text(
                      'Empleados',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
              const SizedBox(height: 20),
              const Text(
                'Nombre Completo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${_con.trabajador?.nombre ?? ""} ${_con.trabajador?.apellido}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Cedula',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                _con.trabajador?.ci ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Correo Electronico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                _con.trabajador?.correo ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 50),
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
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: const Color(0xFfC1272D),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                "assets/icon/user.svg",
                                width: 65,
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                "assets/icon/borrar.svg",
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    GestureDetector(
                      onTap: () {
                        _con.goToEmpleados(_con.idWorker);
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                "assets/icon/user.svg",
                                width: 65,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                "assets/icon/editar.svg",
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
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
            "Eliminar",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          content: const Text(
            "Esta seguro que desea eliminar Permanentemente este perfil",
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
                    backgroundColor: const Color(0xFFC1272D),
                  ),
                  onPressed: () {
                    _con.deleteUser(_con.idWorker);
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

  void refresh() {
    setState(() {});
  }
}
