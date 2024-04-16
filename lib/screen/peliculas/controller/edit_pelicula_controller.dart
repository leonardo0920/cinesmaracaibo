// ignore_for_file: use_build_context_synchronously

import 'package:cinesmaracaibo/models/usuarios/peliculas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/provider/pelicula_provider.dart';

class PeliculaEditController {
  late BuildContext context;
  late Function refresh;

  late PeliculaProvider _peliculaProvider;
  Peliculas? pelicula;

  late String idPelicula;

  String? nombre;
  String? duracion;
  String? idioma;
  String? sala;
  String? genero;
  String? cartelera;

  TextEditingController nombreController = TextEditingController();
  TextEditingController duracionController = TextEditingController();
  TextEditingController idomaController = TextEditingController();
  TextEditingController salaController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController carteleraController = TextEditingController();

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _peliculaProvider = PeliculaProvider();

    idPelicula = ModalRoute.of(context)!.settings.arguments as String;

    getPeliculaInfo();
    refresh();
  }

  void getPeliculaInfo() async {
    Stream<DocumentSnapshot> userStream =
        _peliculaProvider.getByIdStream(idPelicula);
    userStream.listen(
      (DocumentSnapshot document) {
        pelicula = Peliculas.fromJson(document.data() as Map<String, dynamic>);
        refresh();
      },
    );
    refresh();
  }

  Future<void> update(String id) async {
    if (nombreController.text != '') {
      nombre = nombreController.text;
    } else {
      nombre = pelicula!.nombre;
    }

    if (duracionController.text != '') {
      duracion = duracionController.text;
    } else {
      duracion = pelicula!.duracion;
    }

    if (idomaController.text != '') {
      idioma = idomaController.text;
    } else {
      idioma = pelicula!.idioma;
    }

    if (salaController.text != '') {
      sala = salaController.text;
    } else {
      sala = pelicula!.sala;
    }

    if (generoController.text != '') {
      genero = generoController.text;
    } else {
      genero = pelicula!.genero;
    }

    if (carteleraController.text != '') {
      cartelera = carteleraController.text;
    } else {
      cartelera = pelicula!.cartelera;
    }

    Map<String, dynamic> data = {
      'nombre': nombre,
      'duracion': duracion,
      'idioma': idioma,
      'sala': sala,
      'genero': genero,
      'cartelera': cartelera,
    };

    await _peliculaProvider.update(data, id);

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Se han actualizado los datos del Empleado"),
        backgroundColor: Colors.black,
        elevation: 10,
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
    refresh();
  }
}
