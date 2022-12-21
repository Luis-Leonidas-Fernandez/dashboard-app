import 'package:admin_dashboard/dataTables/base_datasource.dart';
import 'package:admin_dashboard/providers/files_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemandaView extends StatefulWidget {
  const DemandaView({Key? key}) : super(key: key);

  @override
  State<DemandaView> createState() => _DemandaViewState();
}

class _DemandaViewState extends State<DemandaView> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {    
    super.initState();
    Provider.of<FilesService>(context, listen:false).getFiles();
  }
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FilesService>(context).data;
    return Container(
      child: Center(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Text(
              'Demandas',
              style: CustomLabels.h1,
            ),
            SizedBox(height: 10),
            PaginatedDataTable(
              columns: [
                DataColumn(label: Text('DNI',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('APELLIDOS',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('NOMBRES',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('JERARQUIA',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('PLAZA',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('EXPTES',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('INTERNOS',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('TIPO TRAMITE')),
                DataColumn(label: Text('TITULO')),
                DataColumn(label: Text('TRANSFERENCIA',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('FECHA',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('LUGAR',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('MOTIVO',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('OBSERVACION',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('INSTRUMENTO',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('RESOLUCION',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('ESTADO',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('FAVORABLE',style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)),
              ],
              source: DataBase(data, context),
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