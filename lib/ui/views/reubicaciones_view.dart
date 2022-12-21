import 'package:admin_dashboard/dataTables/base_administrado.dart';
import 'package:admin_dashboard/providers/files_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/administrado_Modal_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReubicacionesView extends StatefulWidget {
  const ReubicacionesView({Key? key}) : super(key: key);

  @override
  State<ReubicacionesView> createState() => _ReubicacionesViewState();
}

class _ReubicacionesViewState extends State<ReubicacionesView> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {
    super.initState();
    Provider.of<FilesService>(context, listen: false).getAdministrados();
  }

  @override
  Widget build(BuildContext context) {
    final administrado = Provider.of<FilesService>(context).administrado;

    return Container(
      child: Center(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Text(
              'Administrados',
              style: CustomLabels.h1,
            ),
            SizedBox(height: 10),
            PaginatedDataTable(
              columns: [
                DataColumn(
                    label: Text(
                  'ID',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'DNI',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'APELLIDOS',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'NOMBRES',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'JERARQUIA',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'PLAZA',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'EXPTE',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'MODIFICAR',
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
              source: BaseAdministados(administrado, context),
              header: Text('División Escalafón Policial'),
              onRowsPerPageChanged: (value) {
                _rowPerPage = value ?? 10;
              },
              rowsPerPage: _rowPerPage,
              actions: [
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          barrierColor: Colors.white.withOpacity(0),
                          context: context,
                          builder: (_) =>
                              AdministradoModalRegister(administrado: null));
                    },
                    child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Icon(
                            Icons.add_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 0.8,
                          ),
                          Text('crear'),
                        ]),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
