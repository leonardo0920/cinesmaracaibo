import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'controller/nuevo_empleado_controller.dart';

class NuevoEmpleadoPage extends StatefulWidget {
  static String routeName = "/nuevo_empleado_page";
  const NuevoEmpleadoPage({super.key});
  @override
  State<NuevoEmpleadoPage> createState() => _NuevoEmpleadoPageState();
}

class _NuevoEmpleadoPageState extends State<NuevoEmpleadoPage> {
  final NuevoEmpleadoController _con = NuevoEmpleadoController();

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
                'Formulario de Empleado',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                'Informacion personal y bancarios del empleado',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              buildNombresFormField(),
              const SizedBox(height: 8),
              buildApellidosFormField(),
              const SizedBox(height: 8),
              buildCedulaFormField(),
              const SizedBox(height: 8),
              buildCorreoFormField(),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _con.nuevoEmpleado(),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF006D85),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'Crear Empleado',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildNombresFormField() {
    return TextFormField(
      controller: _con.nombreController,
      decoration: const InputDecoration(
        hintText: "Primer y Segundo Nombre",
        hintStyle: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
      style: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }

  TextFormField buildApellidosFormField() {
    return TextFormField(
      controller: _con.apellidoController,
      decoration: const InputDecoration(
        hintText: "Primer y Segundo Apellido",
        hintStyle: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
      style: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }

  TextFormField buildCedulaFormField() {
    return TextFormField(
      controller: _con.cedulaController,
      decoration: const InputDecoration(
        hintText: "Cedula",
        hintStyle: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
      style: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }

  TextFormField buildCorreoFormField() {
    return TextFormField(
      controller: _con.correoController,
      decoration: const InputDecoration(
        hintText: "Correo Electronico",
        hintStyle: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
      style: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
