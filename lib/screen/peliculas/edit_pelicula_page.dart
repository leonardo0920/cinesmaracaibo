import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'controller/edit_pelicula_controller.dart';

class PeliculaEditPage extends StatefulWidget {
  static String routeName = "/pelicula_edit_page";

  const PeliculaEditPage({super.key});
  @override
  State<PeliculaEditPage> createState() => _PeliculaEditPageState();
}

class _PeliculaEditPageState extends State<PeliculaEditPage> {
  final PeliculaEditController _con = PeliculaEditController();

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
            'Editar Pelicula',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 800,
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
                    'Datos de la Pelicula',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  buildNombreFormField(),
                  const SizedBox(height: 15),
                  buildDuracionFormField(),
                  const SizedBox(height: 15),
                  buildIdiomaFormField(),
                  const SizedBox(height: 15),
                  buildSalaFormField(),
                  const SizedBox(height: 15),
                  buildGeneroFormField(),
                  const SizedBox(height: 15),
                  buildCarteleraFormField(),
                  const SizedBox(height: 45),
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
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF006D85),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Editar',
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
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void alertButton() {
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: const Text(
            "Editar",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          content: const Text(
            "Esta seguro que desea Editar este perfil",
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
                    backgroundColor: Colors.grey[600],
                  ),
                  onPressed: () {
                    _con.update(_con.idPelicula);
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

  TextFormField buildNombreFormField() {
    return TextFormField(
      controller: _con.nombreController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Nombre",
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   ${_con.pelicula?.nombre}",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField buildDuracionFormField() {
    return TextFormField(
      controller: _con.duracionController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Duracion",
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   ${_con.pelicula?.duracion}",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField buildIdiomaFormField() {
    return TextFormField(
      controller: _con.idomaController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Idioma",
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   ${_con.pelicula?.idioma}",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField buildSalaFormField() {
    return TextFormField(
      controller: _con.salaController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Sala",
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   ${_con.pelicula?.sala}",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField buildGeneroFormField() {
    return TextFormField(
      controller: _con.generoController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Genero",
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   ${_con.pelicula?.genero}",
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField buildCarteleraFormField() {
    return TextFormField(
      controller: _con.carteleraController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: "Cartelera",
        labelStyle: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   Link de la Imagen",
        hintStyle: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
