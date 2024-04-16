// ignore_for_file: use_build_context_synchronously

import 'package:cinesmaracaibo/models/usuarios/peliculas.dart';
import 'package:flutter/material.dart';

import '../../../models/provider/pelicula_provider.dart';

class NuevaPeliculaController {
  late BuildContext context;
  late Function refresh;

  late PeliculaProvider _peliculaProvider;
  Peliculas? pelicula;

  TextEditingController nombreController = TextEditingController();
  TextEditingController duracionController = TextEditingController();
  TextEditingController idiomaController = TextEditingController();
  TextEditingController salaController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController carteleraController = TextEditingController();

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _peliculaProvider = PeliculaProvider();

    refresh();
  }

  void nuevoEmpleado() async {
    if (nombreController.text != '' &&
        duracionController.text != '' &&
        idiomaController.text != '' &&
        salaController.text != '' &&
        generoController.text != '' &&
        carteleraController.text != '') {
      Peliculas data = Peliculas(
        nombre: nombreController.text,
        duracion: duracionController.text,
        idioma: idiomaController.text,
        sala: idiomaController.text,
        cartelera: carteleraController.text,
        genero: generoController.text,
      );

      await _peliculaProvider.create(data);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("La Pelicula se a creado Correctamente"),
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
