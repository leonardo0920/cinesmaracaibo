import 'package:cinesmaracaibo/models/auth/auth.dart';
import 'package:cinesmaracaibo/screen/home/cartelera_page.dart';
import 'package:cinesmaracaibo/screen/empleados/detalle_empleado_page.dart';
import 'package:cinesmaracaibo/screen/empleados/empleados_edit_page.dart';
import 'package:cinesmaracaibo/screen/empleados/empleados_lista_page.dart';
import 'package:cinesmaracaibo/screen/empleados/nuevo_empleado_page.dart';
import 'package:cinesmaracaibo/screen/home/empleados_page.dart';
import 'package:cinesmaracaibo/screen/home/home_page.dart';
import 'package:cinesmaracaibo/screen/home/peliculas_page.dart';
import 'package:cinesmaracaibo/screen/home/salas_page.dart';
import 'package:cinesmaracaibo/screen/login/login_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Auth.routeName: (context) => const Auth(),
  LoginPage.routeName: (context) => const LoginPage(),
  HomePage.routeName: (context) => const HomePage(),
  CarteleraPage.routeName: (context) => const CarteleraPage(),
  PeliculasPage.routeName: (context) => const PeliculasPage(),
  SalasPage.routeName: (context) => const SalasPage(),
  EmpleadosPage.routeName: (context) => const EmpleadosPage(),
  DetalleEmpleadoPage.routeName: (context) => const DetalleEmpleadoPage(),
  EmpleadoEditPage.routeName: (context) => const EmpleadoEditPage(),
  EmpleadosListaPage.routeName: (context) => const EmpleadosListaPage(),
  NuevoEmpleadoPage.routeName: (context) => const NuevoEmpleadoPage(),
};
