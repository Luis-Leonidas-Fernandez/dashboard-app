// To parse this JSON data, do
//
//     final instrumentoResponse = instrumentoResponseFromMap(jsonString);

import 'dart:convert';

class InstrumentoResponse {
    InstrumentoResponse({
        required this.instrumentos,
    });

    List<Instrumento> instrumentos;

    factory InstrumentoResponse.fromJson(String str) => InstrumentoResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory InstrumentoResponse.fromMap(Map<String, dynamic> json) => InstrumentoResponse(
        instrumentos: List<Instrumento>.from(json["instrumentos"].map((x) => Instrumento.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "instrumentos": List<dynamic>.from(instrumentos.map((x) => x.toMap())),
    };
}

class Instrumento {
    Instrumento({
        required this.idExpediente,
        required this.numeroInstrumento,
        required this.resolucion,
        required this.createdAt,
        required this.updatedAt,
        required this.uid,
    });

    String idExpediente;
    List<String> numeroInstrumento;
    String resolucion;
    DateTime createdAt;
    DateTime updatedAt;
    String uid;

    factory Instrumento.fromJson(String str) => Instrumento.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Instrumento.fromMap(Map<String, dynamic> json) => Instrumento(
        idExpediente: json["idExpediente"],
        numeroInstrumento: List<String>.from(json["numeroInstrumento"].map((x) => x)),
        resolucion: json["resolucion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        uid: json["uid"],
    );

    Map<String, dynamic> toMap() => {
        "idExpediente": idExpediente,
        "numeroInstrumento": List<dynamic>.from(numeroInstrumento.map((x) => x)),
        "resolucion": resolucion,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "uid": uid,
    };
}
