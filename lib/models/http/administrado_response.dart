// To parse this JSON data, do
//
//     final administradoResp = administradoRespFromMap(jsonString);

import 'dart:convert';

class AdministradoResp {
  AdministradoResp({
    required this.administrado,
  });

  Administrado administrado;
  

  factory AdministradoResp.fromJson(String str) =>
      AdministradoResp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdministradoResp.fromMap(Map<String, dynamic> json) =>
      AdministradoResp(
        administrado: Administrado.fromMap(json["administrado"]),
      );

  Map<String, dynamic> toMap() => {
        "administrado": administrado.toMap(),
      };
}

class Administrado {
  Administrado({
    this.apellidos,
    required this.nombres,
    required this.jerarquia,
    required this.plaza,
    required this.dni,
    this.uid,
  });

  String? apellidos;
  String nombres;
  String jerarquia;
  int plaza;
  int dni;
  String? uid;

  factory Administrado.fromJson(String str) =>
      Administrado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Administrado.fromMap(Map<String, dynamic> json) => Administrado(
        apellidos: json["apellidos"] ?? '',
        nombres: json["nombres"],
        jerarquia: json["jerarquia"],
        plaza: json["plaza"],
        dni: json["dni"],
        uid: json["uid"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "apellidos": apellidos,
        "nombres": nombres,
        "jerarquia": jerarquia,
        "plaza": plaza,
        "dni": dni,
        "uid": uid,
      };
}
