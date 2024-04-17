import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'controller/nuevo_pelicula_controller.dart';

class NuevaPeliculaPage extends StatefulWidget {
  static String routeName = "/nueva_pelicula_page";
  const NuevaPeliculaPage({super.key});
  @override
  State<NuevaPeliculaPage> createState() => _NuevaPeliculaPageState();
}

class _NuevaPeliculaPageState extends State<NuevaPeliculaPage> {
  final NuevaPeliculaController _con = NuevaPeliculaController();

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
          'Agregar Pelicula',
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
                'Formulario Pelicula',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              buildNombresFormField(),
              const SizedBox(height: 8),
              buildDuracionFormField(),
              const SizedBox(height: 8),
              buildIdiomaFormField(),
              const SizedBox(height: 8),
              buildSalaFormField(),
              const SizedBox(height: 8),
              buildGeneroFormField(),
              const SizedBox(height: 8),
              buildCarteleraFormField(),
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
                          color: const Color(0xFF006D85),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'Agregar Pelicula',
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
        hintText: "Nombre de la Pelicula",
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

  TextFormField buildDuracionFormField() {
    return TextFormField(
      controller: _con.duracionController,
      decoration: const InputDecoration(
        hintText: "Duracion de la pelicula",
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

  TextFormField buildIdiomaFormField() {
    return TextFormField(
      controller: _con.idiomaController,
      decoration: const InputDecoration(
        hintText: "Idioma",
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

  TextFormField buildSalaFormField() {
    return TextFormField(
      controller: _con.salaController,
      decoration: const InputDecoration(
        hintText: "Sala",
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

  TextFormField buildGeneroFormField() {
    return TextFormField(
      controller: _con.generoController,
      decoration: const InputDecoration(
        hintText: "Genero de la Pelicula",
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

  TextFormField buildCarteleraFormField() {
    return TextFormField(
      controller: _con.carteleraController,
      decoration: const InputDecoration(
        hintText: "Link de la Imagen",
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
