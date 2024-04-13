import 'dart:convert';

Trabajador trabajadorFromMap(String str) =>
    Trabajador.fromJson(json.decode(str));

String trabajadorrToMap(Trabajador data) => json.encode(data.toJson());

class Trabajador {
  String id;
  String nombre;
  String apellido;
  String ci;
  bool admin;
  String token;
  String correo;

  Trabajador({
    this.id = "",
    this.nombre = "",
    this.apellido = "",
    this.ci = "",
    this.admin = false,
    this.token = "",
    this.correo = "",
  });

  factory Trabajador.fromJson(Map<String, dynamic> json) => Trabajador(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        admin: json["admin"],
        token: json["token"],
        correo: json["correo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "admin": admin,
        "token": token,
        "correo": correo,
      };
}
