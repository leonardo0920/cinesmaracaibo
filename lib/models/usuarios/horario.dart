import 'dart:convert';

Horario horarioFromJson(String str) => Horario.fromJson(json.decode(str));

String horarioToJson(Horario data) => json.encode(data.toJson());

class Horario {
  String id;
  String pelicula;
  String horarioE;
  String horarioT;
  String sala;

  Horario({
    this.id = '',
    this.pelicula = '',
    this.horarioE = '',
    this.horarioT = '',
    this.sala = '',
  });

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        id: json["id"],
        pelicula: json["pelicula"],
        horarioE: json["horarioE"],
        horarioT: json["horarioT"],
        sala: json["sala"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pelicula": pelicula,
        "horarioE": horarioE,
        "horarioT": horarioT,
        "sala": sala,
      };
}
