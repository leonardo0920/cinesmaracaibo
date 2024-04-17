// ignore_for_file: deprecated_member_use

import 'package:cinesmaracaibo/screen/home/empleados_page.dart';
import 'package:cinesmaracaibo/screen/home/cartelera_page.dart';
import 'package:cinesmaracaibo/screen/home/peliculas_page.dart';
import 'package:cinesmaracaibo/screen/home/salas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home_page";

  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _con = HomeController();

  int _currentIndex = 0;

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'CinesVE',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                _con.refresh();
                // ignore: avoid_print
                print('Recarga');
              });
            },
            child: const Icon(
              Icons.replay_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[350],
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        indicatorColor: Colors.grey[500],
        selectedIndex: _currentIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: const Icon(Icons.workspaces_outlined),
            label: 'Cartelera',
            selectedIcon: Icon(
              Icons.workspaces_rounded,
              color: Colors.grey[800],
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.access_time_rounded),
            label: 'Horarios',
            selectedIcon: Icon(
              Icons.access_time_filled_rounded,
              color: Colors.grey[800],
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.add_photo_alternate_outlined),
            label: 'Peliculas',
            selectedIcon: Icon(
              Icons.add_photo_alternate_rounded,
              color: Colors.grey[800],
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.account_circle_outlined),
            label: 'Empleado',
            selectedIcon: Icon(
              Icons.account_circle_rounded,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const <Widget>[
          CarteleraPage(),
          SalasPage(),
          PeliculasPage(),
          EmpleadosPage(),
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
