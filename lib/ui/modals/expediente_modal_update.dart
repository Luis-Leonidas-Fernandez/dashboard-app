import 'package:admin_dashboard/models/http/files_response.dart';
import 'package:admin_dashboard/providers/files_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpedienteModalUpdate extends StatefulWidget {
  //
  final Expediente? data;
  //
  ExpedienteModalUpdate({Key? key, this.data}) : super(key: key);

  @override
  State<ExpedienteModalUpdate> createState() => _ExpedienteModalUpdateState();
}

class _ExpedienteModalUpdateState extends State<ExpedienteModalUpdate> {
  //
  late String id = '';
  //
  late List<String> expedientes = [''];
  late List<String> internos = [''];
  late List<String> agregados = [''];
  late String tipoTramite = '';
  late String titulo = '';
  late String transferencia = '';
  late String fecha = '';
  late String lugar = '';
  late String motivo = '';
  late String observacion = '';
  //
  @override
  void initState() {
    super.initState();

    id = widget.data?.id ?? '';
    expedientes = widget.data?.expedientes ?? [''];
    internos = widget.data?.internos ?? [''];
    agregados = widget.data?.agregados ?? [''];
    tipoTramite = widget.data?.tipoTramite ?? '';
    titulo = widget.data?.titulo ?? '';
    transferencia = widget.data?.transferencia ?? '';
    fecha = widget.data?.fecha ?? '';
    lugar = widget.data?.lugar ?? '';
    motivo = widget.data?.motivo ?? '';
    observacion = widget.data?.observacion ?? '';
  }

  @override
  Widget build(BuildContext context) {
    //
    final fileService = Provider.of<FilesService>(context, listen: false);
    final size = MediaQuery.of(context).size;

    final lis = widget.data!.expedientes;
    final expteString = lis!.join();

    final res = widget.data!.internos;
    final internoString = res!.join();

    final obj = widget.data!.agregados;
    final agregadosString = obj!.join();

    return size.width >= 700
        ? Container(
            height: size.height,
            width: size.width,
            decoration: buildBoxDecoration(),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                      child: Text(
                        'Actualizar Expediente',
                        style: CustomLabels.h2.copyWith(color: Colors.white),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: expteString,
                          onChanged: (value) => expedientes = <String>[value],
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Expedientes',
                              label: 'Expedientes N°',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: internoString,
                          onChanged: (value) => internos = <String>[value],
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Internos',
                              label: 'Internos',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: widget.data?.tipoTramite,
                          onChanged: (value) => tipoTramite = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Tipo Tramite',
                              label: 'Tipo Tramite',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: widget.data?.titulo,
                          onChanged: (value) => titulo = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Titulo',
                              label: 'Titulo',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: widget.data?.transferencia,
                          onChanged: (value) => transferencia = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Transferencia',
                              label: 'Transferencia',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: widget.data?.fecha,
                          onChanged: (value) => fecha = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Fecha',
                              label: 'Fecha',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: widget.data?.lugar,
                          onChanged: (value) => lugar = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Lugar',
                              label: 'Lugar',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: widget.data?.motivo,
                          onChanged: (value) => motivo = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Motivo',
                              label: 'Motivo',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          initialValue: widget.data?.observacion,
                          onChanged: (value) => observacion = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Observacion',
                              label: 'Observacion',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                        initialValue: agregadosString,
                        onChanged: (value) => agregados = <String>[value],
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'agregados',
                            label: 'Agregados',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                ]),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  child: CustomOutlinedButton(
                    onPressed: () async {
                      // Crear
                      await fileService.updatedExpte(
                          id,
                          expedientes,
                          internos,
                          agregados,
                          tipoTramite,
                          titulo,
                          transferencia,
                          fecha,
                          lugar,
                          motivo,
                          observacion);

                      NotificationsService.showSnackbar(
                          '$expedientes Actualizado!');
                      Navigator.of(context).pop();
                    },
                    text: 'Guardar',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          )
        : Container(
            height: size.height,
            width: size.width,
            decoration: buildBoxDecoration(),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                      child: Text(
                        'Actualizar Expediente',
                        style: CustomLabels.h2.copyWith(color: Colors.white),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                ),
                SizedBox(height: 15),
                Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: expteString,
                        onChanged: (value) =>
                            expedientes = value as List<String>,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Expedientes',
                            label: 'Expedientes',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          cursorColor: Colors.white,
                          initialValue: internoString,
                          onChanged: (value) =>
                              expedientes = value as List<String>,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Internos',
                              label: 'Internos',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.data?.tipoTramite,
                        onChanged: (value) => tipoTramite = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Tipo Tramite',
                            label: 'Tipo Tramite',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          cursorColor: Colors.white,
                          initialValue: widget.data?.titulo,
                          onChanged: (value) => titulo = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Titulo',
                              label: 'Titulo',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          cursorColor: Colors.white,
                          initialValue: widget.data?.transferencia,
                          onChanged: (value) => transferencia = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Transferencia',
                              label: 'Transferencia',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.data?.fecha,
                        onChanged: (value) => fecha = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Fecha', label: 'Fecha', icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          cursorColor: Colors.white,
                          initialValue: widget.data?.lugar,
                          onChanged: (value) => lugar = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Lugar',
                              label: 'Lugar',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          cursorColor: Colors.white,
                          initialValue: widget.data?.motivo,
                          onChanged: (value) => motivo = value,
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Motivo',
                              label: 'Motivo',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.data?.observacion,
                        onChanged: (value) => observacion = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Observacion',
                            label: 'Observacion',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 2, top: 3),
                      height: 40,
                      width: 350,
                      child: TextFormField(
                          cursorColor: Colors.white,
                          initialValue: agregadosString,
                          onChanged: (value) => agregados = <String>[value],
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Agregados',
                              label: 'Agregados',
                              icon: Icons.person),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: CustomOutlinedButton(
                    onPressed: () async {
                      // Crear
                      await fileService.postExpediente(
                          id,
                          expedientes,
                          internos,
                          agregados,
                          tipoTramite,
                          titulo,
                          transferencia,
                          fecha,
                          lugar,
                          motivo,
                          observacion);

                      NotificationsService.showSnackbar('$expedientes creado!');
                      Navigator.of(context).pop();

                      // Actualizar
                      //await categoryProvider.updateCategory( id!, nombre );
                      //NotificationsService.showSnackbar('$nombre Actualizado!');
                    },

                    //NotificationsService.showSnackbarError('No se pudo guardar la categoría');

                    text: 'Guardar',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Color.fromRGBO(55, 110, 219, 1),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
