import 'package:admin_dashboard/models/http/instrumento.dart';
import 'package:admin_dashboard/providers/files_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/modals/instrumento_modal_update.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BaseInstrumentos extends DataTableSource {
  //
  final List<Instrumento> instrumentos;
  final BuildContext context;

  BaseInstrumentos(this.instrumentos, this.context);
  //
  @override
  DataRow getRow(int index) {
    //
    final instrumento = this.instrumentos[index];

    final list = instrumento.numeroInstrumento;
    final instrumentoList = list.join();

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(instrumento.uid)),
      DataCell(Text(instrumentoList)),
      DataCell(Text(instrumento.resolucion)),
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
                      InstrumentoModalUpdate(instrumento: instrumento));
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
                    '¿Borrar definitivamente ${instrumento.numeroInstrumento}',
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
                              .deletedInstrumento(instrumento.uid);
                          //
                          Navigator.of(context).pop();
                          NotificationsService.showSnackbar('Eliminado!');
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
  int get rowCount => instrumentos.length;

  @override
  int get selectedRowCount => 0;
}
