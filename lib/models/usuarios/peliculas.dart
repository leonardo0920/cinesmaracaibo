import 'dart:convert';

Peliculas peliculasFromJson(String str) => Peliculas.fromJson(json.decode(str));

String peliculasToJson(Peliculas data) => json.encode(data.toJson());

class Peliculas {
  String id;
  String nombre;
  String genero;
  String duracion;
  String sala;
  String cartelera;
  String idioma;

  Peliculas({
    this.id = '',
    this.nombre = '',
    this.genero = '',
    this.duracion = '',
    this.sala = '',
    this.cartelera = '',
    this.idioma = '',
  });

  factory Peliculas.fromJson(Map<String, dynamic> json) => Peliculas(
        id: json["id"],
        nombre: json["nombre"],
        genero: json["genero"],
        duracion: json["duracion"],
        sala: json["sala"],
        cartelera: json["cartelera"],
        idioma: json["idioma"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "genero": genero,
        "duracion": duracion,
        "sala": sala,
        "cartelera": cartelera,
        "idioma": idioma,
      };
}
