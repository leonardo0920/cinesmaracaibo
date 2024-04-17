import 'package:cinesmaracaibo/screen/horario/controller/agregar_horario_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../size_config.dart';

class AgregarHorarioPage extends StatefulWidget {
  static String routeName = "/agregar_horario_page";
  const AgregarHorarioPage({super.key});

  @override
  State<AgregarHorarioPage> createState() => _AgregarHorarioPageState();
}

class _AgregarHorarioPageState extends State<AgregarHorarioPage> {
  final AgregarHorarioController _con = AgregarHorarioController();

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
          'Horario',
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
            children: [
              SizedBox(
                width: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Agregar Horario',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    buildPeliculaFormField(),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    buildSalaFormField(),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    fechas(),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _con.agregar();
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF006D85),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              'Enviar',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
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

  Widget fechas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            _con.selectHorarioE();
          },
          child: Column(
            children: [
              const Text(
                'Empieza',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                width: 140,
                height: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 15,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _con.horarioE ?? '',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _con.selectHorarioT(),
          child: Column(
            children: [
              const Text(
                'Termina',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                width: 140,
                height: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 15,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _con.horarioT ?? '',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  TextFormField buildPeliculaFormField() {
    return TextFormField(
      controller: _con.peliculaController,
      decoration: InputDecoration(
        hintText: "Pelicula",
        hintStyle: const TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.grey[900],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
      decoration: InputDecoration(
        hintText: "Sala",
        hintStyle: const TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.grey[900],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
