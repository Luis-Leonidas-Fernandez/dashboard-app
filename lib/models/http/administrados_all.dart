// To parse this JSON data, do
//
//     final administradosAll = administradosAllFromMap(jsonString);

import 'dart:convert';

class AdministradosAll {
  AdministradosAll({
    required this.administrados,
  });

  List<Administrado> administrados;

  factory AdministradosAll.fromJson(String str) =>
      AdministradosAll.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdministradosAll.fromMap(Map<String, dynamic> json) =>
      AdministradosAll(
        administrados: List<Administrado>.from(
            json["administrados"].map((x) => Administrado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "administrados":
            List<dynamic>.from(administrados.map((x) => x.toMap())),
      };
}

class Administrado {
  Administrado({
    required this.apellidos,
    required this.nombres,
    required this.jerarquia,
    required this.plaza,
    required this.dni,
    this.uid,
  });

  String apellidos;
  String nombres;
  String jerarquia;
  int plaza;
  int dni;
  String? uid;

  factory Administrado.fromJson(String str) =>
      Administrado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Administrado.fromMap(Map<String, dynamic> json) => Administrado(
        apellidos: json["apellidos"],
        nombres: json["nombres"],
        jerarquia: json["jerarquia"],
        plaza: json["plaza"],
        dni: json["dni"],
        uid: json["uid"]?? '',
      );

  Map<String, dynamic> toMap() => {
        "apellidos": apellidos,
        "nombres": nombres,
        "jerarquia": jerarquia,
        "plaza": plaza,
        "dni": dni,
        "uid": uid?? '',
      };
}
