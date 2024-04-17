import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../size_config.dart';
import 'controller/home_controller.dart';

class SalasPage extends StatefulWidget {
  static String routeName = "/salas_page";

  const SalasPage({super.key});
  @override
  State<SalasPage> createState() => _SalasPageState();
}

class _SalasPageState extends State<SalasPage> {
  final HomeController _con = HomeController();
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Horarios',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _con.addHorario();
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: SizeConfig.screenHeight * 0.73,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: FutureBuilder(
                                    future: _con.horarioGetAll(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          itemCount: snapshot.data?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            return horario(
                                              snapshot.data![index]['id'],
                                              snapshot.data![index]['pelicula'],
                                              snapshot.data![index]['horarioE'],
                                              snapshot.data![index]['horarioT'],
                                              snapshot.data![index]['sala'],
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
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget horario(
    String id,
    String pelicula,
    String horarioE,
    String horarioT,
    String sala,
  ) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pelicula,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Horario: $horarioE - $horarioT',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Sala: $sala',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _con.deleteHorario(id);
            },
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
