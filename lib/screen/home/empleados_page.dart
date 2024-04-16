import 'package:cinesmaracaibo/screen/empleados/empleados_lista_page.dart';
import 'package:cinesmaracaibo/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'controller/home_controller.dart';

class EmpleadosPage extends StatefulWidget {
  static String routeName = "/empleados_page";

  const EmpleadosPage({super.key});
  @override
  State<EmpleadosPage> createState() => _EmpleadosPageState();
}

class _EmpleadosPageState extends State<EmpleadosPage> {
  final HomeController _con = HomeController();
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                minChildSize: 1,
                maxChildSize: 1,
                builder: (context, scrollController) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                        child: Center(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.grey[900],
                                child: const Icon(
                                  Icons.account_circle_outlined,
                                  size: 90,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _con.trabajador?.nombre ?? 'Nombre',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                _con.trabajador?.correo ?? 'Correo',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, EmpleadosListaPage.routeName);
                                },
                                icon: const Icon(
                                    Icons.accessibility_new_rounded,
                                    color: Colors.white),
                                label: const Text(
                                  'Empleados del Cine',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight * 0.40,
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _con.signOut();
                                },
                                icon: const Icon(Icons.exit_to_app,
                                    color: Colors.white),
                                label: const Text(
                                  'Cerrar Sesión',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 124, 115),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
