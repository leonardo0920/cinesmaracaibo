// ignore_for_file: use_build_context_synchronously

import 'package:cinesmaracaibo/models/provider/horario_provider.dart';
import 'package:cinesmaracaibo/models/usuarios/horario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AgregarHorarioController {
  late BuildContext context;
  late Function refresh;
  FirebaseFirestore db = FirebaseFirestore.instance;

  late HorarioProvider _horarioProvider;

  Horario? horario;

  TextEditingController peliculaController = TextEditingController();
  TextEditingController salaController = TextEditingController();
  TextEditingController horarioEController = TextEditingController();
  TextEditingController horarioTController = TextEditingController();

  TimeOfDay selectedhorarioE = TimeOfDay.now();
  TimeOfDay selectedhorarioT = TimeOfDay.now();
  String? horarioE;
  String? horarioT;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    _horarioProvider = HorarioProvider();

    horarioEController.text = '';
    horarioTController.text = '';
    peliculaController.text = '';
    salaController.text = '';

    refresh();
  }

  void createHorario() async {
    Horario data = Horario(
      pelicula: peliculaController.text,
      sala: salaController.text,
      horarioE: horarioEController.text,
      horarioT: horarioTController.text,
    );

    await _horarioProvider.create(data);
  }

  Future<void> selectHorarioE() async {
    final TimeOfDay? pickedE = await showTimePicker(
      context: context,
      initialTime: selectedhorarioE,
    );
    if (pickedE != null && pickedE != selectedhorarioE) {
      selectedhorarioE = pickedE;
      horarioEController.text =
          '${selectedhorarioE.hour}:${selectedhorarioE.minute}';
      FocusScope.of(context).unfocus();
      refresh();
    }
    horarioE = horarioEController.text;
    refresh();
  }

  Future<void> selectHorarioT() async {
    final TimeOfDay? pickedT = await showTimePicker(
      context: context,
      initialTime: selectedhorarioT,
    );
    if (pickedT != null && pickedT != selectedhorarioT) {
      selectedhorarioT = pickedT;
      horarioTController.text =
          '${selectedhorarioT.hour}:${selectedhorarioT.minute}';
      FocusScope.of(context).unfocus();
      refresh();
    }
    horarioT = horarioTController.text;
    refresh();
  }

  void agregar() {
    if (peliculaController.text != '' &&
        salaController.text != '' &&
        horarioEController.text != '' &&
        horarioTController.text != '') {
      createHorario();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Se ha registrado el Horario Correctamente"),
          backgroundColor: Colors.black,
          elevation: 10,
        ),
      );
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pop(context);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por Favor llene todas las casillas"),
          backgroundColor: Colors.black,
          elevation: 10,
        ),
      );
    }
  }
}
