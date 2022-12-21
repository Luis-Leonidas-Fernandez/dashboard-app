import 'dart:convert';

import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/administrados_all.dart';
import 'package:admin_dashboard/models/http/files_response.dart';
import 'package:admin_dashboard/models/http/instrumento.dart';
import 'package:flutter/material.dart';

class FilesService with ChangeNotifier {
  //
  List<Expediente> data = [];
  List<Administrado> administrado = [];
  List<Instrumento> instrumentos = [];

  getInstrumentos() async {
    final resp = await CafeApi.dataGet('/instrumentos/todos');

    final obj = InstrumentoResponse.fromMap(resp);
    this.instrumentos = [...obj.instrumentos];

    print(this.instrumentos);
    notifyListeners();
  }

  Future deletedInstrumento(String uid) async {
    try {
      await CafeApi.dataDeleted('/instrumentos/delete/$uid', {});

      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al eliminar Instrumento');
    }
  }

  Future updatedInstrumento(
    String uid,
    List<String> numeroInstrumento,
    String resolucion,
  ) async {
    //
    final data = {
      '_id': uid,
      'numeroInstrumento': numeroInstrumento,
      'resolucion': resolucion,
    };

    try {
      await CafeApi.dataUpdated('/instrumentos/update/$uid', data);

      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al actualizar el instrumento');
    }
  }

  getFiles() async {
    final resp = await CafeApi.dataGet('/expedientes/todo');

    final fileResponse = FilesResponse.fromMap(resp);
    this.data = [...fileResponse.expediente];

    print(this.data);
    notifyListeners();
  }

  Future updatedExpte(
      String id,
      List<String> expedientes,
      List<String> internos,
      List<String> agregados,
      String tipoTramite,
      String titulo,
      String transferencia,
      String fecha,
      String lugar,
      String motivo,
      String observacion) async {
    //
    final data = {
      'expedientes': expedientes,
      'internos': internos,
      'agregados': agregados,
      'tipoTramite': tipoTramite,
      'titulo': titulo,
      'transferencia': transferencia,
      'fecha': fecha,
      'lugar': lugar,
      'motivo': motivo,
      'observacion': observacion,
    };
    //
    try {
      await CafeApi.dataUpdated('/expedientes/update/$id', data);

      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al actualizar Expediente');
    }
  }

  Future postExpediente(
      String idAdministrado,
      List<String> expedientes,
      List<String> internos,
      List<String> agregados,
      String tipoTramite,
      String titulo,
      String transferencia,
      String fecha,
      String lugar,
      String motivo,
      String observacion) async {
    //
    //
    final data = {
      //
      'idAdministrado': idAdministrado,
      'expedientes': expedientes,
      'internos': internos,
      'agregados': agregados,
      'tipoTramite': tipoTramite,
      'titulo': titulo,
      'transferencia': transferencia,
      'fecha': fecha,
      'lugar': lugar,
      'motivo': motivo,
      'observacion': observacion,
      //
    };
    try {
      //
      final json = await CafeApi.dataPost('/expedientes/crearExpediente', data);
      final resp = FilesResponse.fromMap(json);

      notifyListeners();
      return resp;
    } catch (e) {
      print(e);
      print('Error al registrar el Expediente');
    }
  }

  Future deletedExpte(String id) async {
    //
    try {
      await CafeApi.dataDeleted('/expedientes/delete/$id', {});

      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al eliminar Expte');
    }
  }

  getAdministrados() async {
    final resp = await CafeApi.dataGet('/administrados/todos');

    final administradoresp = AdministradosAll.fromMap(resp);
    this.administrado = [...administradoresp.administrados];
    //
    print(this.administrado);
    notifyListeners();
  }

  Future deletedAdministrado(String uid) async {
    //
    try {
      await CafeApi.dataDeleted('/administrados/$uid', {});

      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al elinimar admnistrado');
    }
  }

  Future updatedAdministrado(String uid, String apellidos, String nombres,
      String jerarquia, int plaza, int dni) async {
    //
    final data = {
      'dni': dni,
      'apellidos': apellidos,
      'nombres': nombres,
      'jerarquia': jerarquia,
      'plaza': plaza
    };
    //
    try {
      await CafeApi.dataUpdated('/administrados/$uid', data);

      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al actualizar admnistrado');
    }
  }

  Future buildAdministrado(String apellidos, String nombres, String jerarquia,
      int plaza, int dni) async {
    //
    final data = {
      'dni': dni,
      'apellidos': apellidos,
      'nombres': nombres,
      'jerarquia': jerarquia,
      'plaza': plaza
    };

    try {
      //
      //
      final json = await CafeApi.dataPost('/administrados/nuevo', data);
      print(json);
      //
      final resp = AdministradosAll.fromMap(json);
      this.administrado = [...resp.administrados];
      print(this.administrado);

      notifyListeners();
      //
    } catch (e) {
      print(e);
      print('Error al registrar el Administrado');
    }
  }

  Future buildInstrumento(
    String uid,
    List<String> numeroInstrumento,
    String resolucion,
  ) async {
    //
    final data = {
      'idExpediente': uid,
      'numeroInstrumento': numeroInstrumento,
      'resolucion': resolucion,
    };

    try {
      //
      //
      final resp = await CafeApi.dataPost('/instrumentos/nuevo', data);
      print(json);
      //
      final obj = InstrumentoResponse.fromMap(resp);
      this.instrumentos = [...obj.instrumentos];

      notifyListeners();
      return this.instrumentos;

      //
    } catch (e) {
      print(e);
      print('Error al registrar el Instrumento');
    }
  }
}
