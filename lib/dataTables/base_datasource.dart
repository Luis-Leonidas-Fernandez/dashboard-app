import 'package:admin_dashboard/models/http/files_response.dart';
import 'package:admin_dashboard/providers/files_provider.dart';

import 'package:admin_dashboard/ui/modals/expediente_modal_update.dart';
import 'package:admin_dashboard/ui/modals/instrumento_modal_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DataBase extends DataTableSource {
  final List<Expediente> data;
  final BuildContext context;

  DataBase(this.data, this.context);
  @override
  DataRow getRow(int index) {
    final data = this.data[index];

    final list = data.agregados;
    final stringList = list!.join();

    final listExpte = data.expedientes;
    final expteString = listExpte!.join();

    final listInterno = data.internos;
    final internoString = listInterno!.join();

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data.id.toString())),
      DataCell(Text(data.dni.toString())),
      DataCell(Text(data.apellidos.toString())),
      DataCell(Text(data.nombres.toString())),
      DataCell(Text(data.jerarquia.toString())),
      DataCell(Text(data.plaza.toString())),
      DataCell(Text(expteString)),
      DataCell(Text(internoString)),
      DataCell(Text(stringList)),
      DataCell(Text(data.tipoTramite.toString())),
      DataCell(Text(data.titulo.toString())),
      DataCell(Text(data.transferencia.toString())),
      DataCell(Text(data.fecha.toString())),
      DataCell(Text(data.lugar.toString())),
      DataCell(Text(data.motivo.toString())),
      DataCell(Text(data.observacion.toString())),
      DataCell(data.numeroInstrumento == null
          ? Text('')
          : Text(data.numeroInstrumento.toString())),
      DataCell(Text(data.resolucion ?? '')),
      DataCell(Text(data.estado.toString())),
      DataCell(Text(data.favorable.toString())),
      DataCell(
        Row(
          children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => ExpedienteModalUpdate(data: data));
                },
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colors.indigo,
                )),
            IconButton(
                onPressed: () {
                  final dialog = AlertDialog(
                    title: Text(
                      '¿Esta seguro de borrarlo?',
                      style: GoogleFonts.roboto(),
                    ),
                    content: Text(
                      '¿Borrar definitivamente ${data.expedientes}?',
                      style: GoogleFonts.roboto(),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No')),
                      TextButton(
                          onPressed: () async {
                            await Provider.of<FilesService>(context,
                                    listen: false)
                                .deletedExpte(data.id);
                            Navigator.of(context).pop();
                          },
                          child: Text('Sí'))
                    ],
                  );
                  showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (_) => dialog);
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                )),
          ],
        ),
      ),
      DataCell(Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.file_copy_rounded,
              color: Colors.green,
            ),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => InstrumentoModalRegister(data: data));
            },
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
