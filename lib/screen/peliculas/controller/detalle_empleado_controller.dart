import 'package:cinesmaracaibo/models/provider/pelicula_provider.dart';
import 'package:cinesmaracaibo/models/usuarios/peliculas.dart';
import 'package:cinesmaracaibo/screen/peliculas/edit_pelicula_page.dart';
import 'package:flutter/material.dart';

class DetalleEmpleadosController {
  late BuildContext context;
  late Function refresh;

  late PeliculaProvider _peliculaProvider;
  Peliculas? pelicula;

  late String idPelicula;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _peliculaProvider = PeliculaProvider();

    idPelicula = ModalRoute.of(context)!.settings.arguments as String;

    getPeliculaInfo();
    refresh();
  }

  void getPeliculaInfo() async {
    pelicula = await _peliculaProvider.getById(idPelicula);
    refresh();
  }

  void deletePelicula(String id) {
    _peliculaProvider.delete(id);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Se ha Eliminado la Pelicula Correctamente"),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
    );
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
    refresh();
  }

  void goToEditPelicula(String id) {
    Navigator.pushNamed(context, PeliculaEditPage.routeName, arguments: id);
  }
}
