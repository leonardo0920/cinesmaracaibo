import 'package:cinesmaracaibo/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'controller/home_controller.dart';

class CarteleraPage extends StatefulWidget {
  static String routeName = "/cartelera_page";

  const CarteleraPage({super.key});
  @override
  State<CarteleraPage> createState() => _CarteleraPageState();
}

class _CarteleraPageState extends State<CarteleraPage> {
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
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                minChildSize: 1,
                maxChildSize: 1,
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
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Center(
                          child: Column(
                            children: [
                              const Text(
                                'Carteleras',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: SizeConfig.screenHeight * 0.73,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: FutureBuilder(
                                  future: _con.carteleraGetAll(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        itemCount: snapshot.data?.length ?? 0,
                                        itemBuilder: (context, index) {
                                          return pelicula(
                                            snapshot.data![index]['id'],
                                            snapshot.data![index]['nombre'],
                                            snapshot.data![index]['genero'],
                                            snapshot.data![index]['duracion'],
                                            snapshot.data![index]['sala'],
                                            snapshot.data![index]['cartelera'],
                                            snapshot.data![index]['idioma'],
                                          );
                                        },
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ),
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

  Widget pelicula(
    String id,
    String nombre,
    String genero,
    String duracion,
    String sala,
    String img,
    String idioma,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 450,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Genero: $genero',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Duracion: $duracion',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sala: $sala',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      child: Text(
                        'Idioma: $idioma',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
