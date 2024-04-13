// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../constantes.dart';
import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home_page";

  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _con = HomeController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _con.dispose();
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
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.98,
                minChildSize: 0.98,
                maxChildSize: 0.98,
                builder: (context, scrollController) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                _con.trabajador?.nombre ?? 'Nombre',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              pelicula(
                                'Spiderman',
                                'Accion',
                                '120 Min',
                                'https://hips.hearstapps.com/hmg-prod/images/spider-man-across-the-spider-verse-part-one-524691364-large-1657880878.jpg',
                              )
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

  Widget pelicula(String nombre, String genero, String duracion, String img) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 90,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
