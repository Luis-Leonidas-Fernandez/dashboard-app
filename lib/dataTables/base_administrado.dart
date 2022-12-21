import 'package:admin_dashboard/models/http/administrados_all.dart';
import 'package:admin_dashboard/providers/files_provider.dart';
import 'package:admin_dashboard/ui/modals/Expediente_modal_register.dart';
import 'package:admin_dashboard/ui/modals/administrado_modal_update.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BaseAdministados extends DataTableSource {
  //
  final List<Administrado> administrado;
  final BuildContext context;

  BaseAdministados(this.administrado, this.context);
  //
  @override
  DataRow getRow(int index) {
    //
    final administrado = this.administrado[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(administrado.uid.toString())),
      DataCell(Text(administrado.dni.toString())),
      DataCell(Text(administrado.apellidos.toString())),
      DataCell(Text(administrado.nombres.toString())),
      DataCell(Text(administrado.jerarquia.toString())),
      DataCell(Text(administrado.plaza.toString())),
      DataCell(Row(
        children: [
          IconButton(
            //
            icon: Icon(
              Icons.file_copy_rounded,
              color: Colors.indigo,
            ),
            onPressed: () {
              //
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) =>
                      ExpedienteModalRegister(administrado: administrado));
            },
          ),
        ],
      )),
      DataCell(Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.update_outlined,
              color: Colors.green,
            ),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) =>
                      AdministradoModalUpdate(administrado: administrado));
            },
          ),
        ],
      )),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text(
                    '¿Esta seguro de borrarlo?',
                    style: GoogleFonts.roboto(),
                  ),
                  content: Text(
                    '¿Borrar definitivamente ${administrado.apellidos}'
                    ' ${administrado.nombres}?',
                    style: GoogleFonts.roboto(),
                  ),
                  actions: [
                    //
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')),
                    //
                    TextButton(
                        onPressed: () async {
                          //
                          await Provider.of<FilesService>(context,
                                  listen: false)
                              .deletedAdministrado(administrado.uid!);
                          //
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
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => administrado.length;

  @override
  int get selectedRowCount => 0;
}
