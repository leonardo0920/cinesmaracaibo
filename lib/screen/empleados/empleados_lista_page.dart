// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'controller/empleados_controller.dart';
import 'nuevo_empleado_page.dart';

class EmpleadosListaPage extends StatefulWidget {
  static String routeName = "/empleados_lista_page";
  const EmpleadosListaPage({super.key});

  @override
  State<EmpleadosListaPage> createState() => _EmpleadosListaPageState();
}

class _EmpleadosListaPageState extends State<EmpleadosListaPage> {
  final EmpleadosController _con = EmpleadosController();

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 320,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Empleado',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, NuevoEmpleadoPage.routeName);
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: SvgPicture.asset(
                                      "assets/icon/user.svg",
                                      width: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 800,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: FutureBuilder(
                    future: _con.getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return empleado(
                              snapshot.data![index]['id'],
                              snapshot.data![index]['nombre'],
                              snapshot.data![index]['apellido'],
                              snapshot.data![index]['admin'],
                              snapshot.data![index]['ci'],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget empleado(
    String id,
    String nombre,
    String apellido,
    bool admin,
    String ci,
  ) {
    return GestureDetector(
      onTap: () {
        _con.goToDetalleEmpleados(id);
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      "assets/icon/user.svg",
                      width: 35,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$nombre $apellido',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ci,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  admin == true
                      ? const Text(
                          'Admin',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : const Text(
                          'Empelados',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                  admin == true
                      ? const SizedBox(
                          width: 50,
                        )
                      : const SizedBox(
                          width: 30,
                        ),
                  SvgPicture.asset(
                    "assets/icon/editar.svg",
                    width: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
