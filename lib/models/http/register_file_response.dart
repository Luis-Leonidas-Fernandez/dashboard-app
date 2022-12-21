// To parse this JSON data, do
//
//     final registerFileResp = registerFileRespFromMap(jsonString);


import 'dart:convert';

class RegisterFileResp {
    RegisterFileResp({
        required this.expediente,
    });

    OneFile expediente;

    factory RegisterFileResp.fromJson(String str) => RegisterFileResp.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterFileResp.fromMap(Map<String, dynamic> json) => RegisterFileResp(
        expediente: OneFile.fromMap(json["expediente"]),
    );

    Map<String, dynamic> toMap() => {
        "expediente": expediente.toMap(),
    };
}

class OneFile {
    OneFile({
        required this.idAdministrado,
        required this.expedientes,
        this.agregados,
        required this.internos,
        required this.tipoTramite,
        this.titulo,
        this.transferencia,
        required this.fecha,
        required this.lugar,
        required this.motivo,
        this.observacion,
        this.estado,
        this.favorable,
        this.createdAt,
        this.updatedAt,
        this.uid,
    });

    String idAdministrado;
    List<String> expedientes;
    List<dynamic>? agregados;
    List<String> internos;
    String tipoTramite;
    String? titulo;
    String? transferencia;
    String fecha;
    String lugar;
    String motivo;
    String? observacion;
    String? estado;
    bool? favorable;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? uid;

    factory OneFile.fromJson(String str) => OneFile.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OneFile.fromMap(Map<String, dynamic> json) => OneFile(
        idAdministrado: json["idAdministrado"],
        expedientes: List<String>.from(json["expedientes"].map((x) => x)),
        agregados: List<dynamic>.from(json["agregados"].map((x) => x)),
        internos: List<String>.from(json["internos"].map((x) => x)),
        tipoTramite: json["tipoTramite"],
        titulo: json["titulo"],
        transferencia: json["transferencia"],
        fecha: json["fecha"],
        lugar: json["lugar"],
        motivo: json["motivo"],
        observacion: json["observacion"],
        estado: json["estado"],
        favorable: json["favorable"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        uid: json["uid"],
    );

    Map<String, dynamic> toMap() => {
        "idAdministrado": idAdministrado,
        "expedientes": List<dynamic>.from(expedientes.map((x) => x)),
        "agregados": List<dynamic>.from(agregados!.map((x) => x)),
        "internos": List<dynamic>.from(internos.map((x) => x)),
        "tipoTramite": tipoTramite,
        "titulo": titulo,
        "transferencia": transferencia,
        "fecha": fecha,
        "lugar": lugar,
        "motivo": motivo,
        "observacion": observacion,
        "estado": estado,
        "favorable": favorable,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "uid": uid,
    };
}
