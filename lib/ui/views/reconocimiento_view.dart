import 'package:admin_dashboard/dataTables/base_instrumentos.dart';
import 'package:admin_dashboard/providers/files_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReconocimientoView extends StatefulWidget {
  const ReconocimientoView({Key? key}) : super(key: key);

  @override
  State<ReconocimientoView> createState() => _ReconocimientoViewState();
}

class _ReconocimientoViewState extends State<ReconocimientoView> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {
    super.initState();
    Provider.of<FilesService>(context, listen: false).getInstrumentos();
  }

  @override
  Widget build(BuildContext context) {
    final instrumentos = Provider.of<FilesService>(context).instrumentos;
    return Container(
      child: Center(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Text(
              'Instrumentos',
              style: CustomLabels.h1,
            ),
            SizedBox(height: 10),
            PaginatedDataTable(
              columns: [
                DataColumn(
                    label: Text(
                  'UID',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'NUMERO INSTRUMENTO',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'RESOLUCION',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'ACTUALIZAR',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'ELIMINAR',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
              ],
              source: BaseInstrumentos(instrumentos, context),
              header: Text('División Escalafón Policial'),
              onRowsPerPageChanged: (value) {
                _rowPerPage = value ?? 10;
              },
              rowsPerPage: _rowPerPage,
              actions: [
                CustomIconButton(
                  onPressed: () {},
                  text: 'crear',
                  icon: Icons.add_outlined,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
