// To parse this JSON data, do
//
//     final filesResponse = filesResponseFromMap(jsonString);

import 'dart:convert';

class FilesResponse {
  FilesResponse({
    required this.expediente,
  });

  List<Expediente> expediente;

  factory FilesResponse.fromJson(String str) =>
      FilesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FilesResponse.fromMap(Map<String, dynamic> json) => FilesResponse(
        expediente: List<Expediente>.from(
            json["expediente"].map((x) => Expediente.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "expediente": List<dynamic>.from(expediente.map((x) => x.toMap())),
      };
}

class Expediente {
  var idAdministrado;

  Expediente({
    required this.id,
    required this.apellidos,
    required this.nombres,
    required this.jerarquia,
    required this.plaza,
    required this.dni,
    this.numeroInstrumento,
    this.resolucion,
    this.expedientes,
    this.internos,
    this.agregados,
    this.tipoTramite,
    this.titulo,
    this.transferencia,
    this.fecha,
    this.lugar,
    this.motivo,
    this.observacion,
    this.estado,
    this.favorable,
  });

  String id;
  String apellidos;
  String nombres;
  String jerarquia;
  int plaza;
  int dni;
  List<String>? numeroInstrumento;
  String? resolucion;
  List<String>? expedientes;
  List<String>? agregados;
  List<String>? internos;
  String? tipoTramite;
  String? titulo;
  String? transferencia;
  String? fecha;
  String? lugar;
  String? motivo;
  String? observacion;
  String? estado;
  bool? favorable;

  factory Expediente.fromJson(String str) =>
      Expediente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Expediente.fromMap(Map<String, dynamic> json) => Expediente(
        id: json["_id"],
        apellidos: json["apellidos"],
        nombres: json["nombres"],
        jerarquia: json["jerarquia"],
        plaza: json["plaza"],
        dni: json["dni"],
        numeroInstrumento: json["numeroInstrumento"] == null
            ? null
            : List<String>.from(json["numeroInstrumento"].map((x) => x)),
        resolucion: json["resolucion"] == null ? null : json["resolucion"],
        expedientes: List<String>.from(json["expedientes"].map((x) => x)),
        internos: List<String>.from(json["internos"].map((x) => x)),
        agregados: json["agregados"] == null
            ? null
            : List<String>.from(json["agregados"].map((x) => x)),
        tipoTramite: json["tipoTramite"],
        titulo: json["titulo"],
        transferencia: json["transferencia"],
        fecha: json["fecha"],
        lugar: json["lugar"],
        motivo: json["motivo"],
        observacion: json["observacion"],
        estado: json["estado"],
        favorable: json["favorable"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "apellidos": apellidos,
        "nombres": nombres,
        "jerarquia": jerarquia,
        "plaza": plaza,
        "dni": dni,
        "numeroInstrumento": numeroInstrumento == null
            ? null
            : List<dynamic>.from(numeroInstrumento!.map((x) => x)),
        "resolucion": resolucion == null ? null : resolucion,
        "expedientes": List<dynamic>.from(expedientes!.map((x) => x)),
        "internos": List<dynamic>.from(internos!.map((x) => x)),
        "agregados": List<dynamic>.from(agregados!.map((x) => x)),
        "tipoTramite": tipoTramite,
        "titulo": titulo,
        "transferencia": transferencia,
        "fecha": fecha,
        "lugar": lugar,
        "motivo": motivo,
        "observacion": observacion,
        "estado": estado,
        "favorable": favorable,
      };
  @override
  String toString() {
    return super.toString();
  }
}
