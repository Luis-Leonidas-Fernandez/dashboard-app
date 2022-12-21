import 'package:admin_dashboard/models/http/instrumento.dart';
import 'package:admin_dashboard/providers/files_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstrumentoModalUpdate extends StatefulWidget {
  //
  final Instrumento? instrumento;

  InstrumentoModalUpdate({Key? key, this.instrumento}) : super(key: key);

  @override
  State<InstrumentoModalUpdate> createState() => _InstrumentoModalUpdateState();
}

class _InstrumentoModalUpdateState extends State<InstrumentoModalUpdate> {
  //
  late String uid = '';
  late List<String> numeroInstrumento = [''];
  late String resolucion = '';

  //

  @override
  void initState() {
    super.initState();
    uid = widget.instrumento?.uid ?? '';
    numeroInstrumento = widget.instrumento?.numeroInstrumento ?? [''];
    resolucion = widget.instrumento?.resolucion ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final fileService = Provider.of<FilesService>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return size.width >= 700
        ? Container(
            height: 500,
            width: 300,
            decoration: buildBoxDecoration(),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                    child: Text(
                      'Actualizar Instrumento',
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
                        initialValue:
                            widget.instrumento?.numeroInstrumento.toString(),
                        onChanged: (value) =>
                            numeroInstrumento = <String>[value],
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Numero Instrumento',
                            label: 'NUMERO INSTRUMENTO',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                        initialValue: widget.instrumento?.resolucion,
                        onChanged: (value) => resolucion = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Resolucion',
                            label: 'RESOLUCIÓN',
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
                    //
                    await fileService.updatedInstrumento(
                        uid, numeroInstrumento, resolucion);
                    //
                    NotificationsService.showSnackbar(
                        '$numeroInstrumento Actualizado!');
                    //
                    Navigator.of(context).pop();

                    //NotificationsService.showSnackbarError('No se pudo guardar la categoría');
                  },
                  text: 'Guardar',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
            ]))
        : Container(
            decoration: buildBoxDecoration(),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                    child: Text(
                      'Actualizar Instrumento',
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
                children: [],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue:
                            widget.instrumento?.numeroInstrumento.toString(),
                        onChanged: (value) =>
                            numeroInstrumento = <String>[value],
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Numero Instrumento',
                            label: 'Numero Instrumento',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(children: [
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  height: 40,
                  width: 350,
                  child: TextFormField(
                      cursorColor: Colors.white,
                      initialValue: widget.instrumento?.resolucion,
                      onChanged: (value) => resolucion = value,
                      decoration: CustomInputs.loginInputDecoration(
                          hint: 'Resolución',
                          label: 'RESOLUCIÓN',
                          icon: Icons.person),
                      style: TextStyle(color: Colors.white)),
                ),
              ]),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: CustomOutlinedButton(
                  onPressed: () async {
                    try {
                      {
                        // Crear
                        await fileService.updatedInstrumento(
                            uid, numeroInstrumento, resolucion);
                        NotificationsService.showSnackbar(
                            '$numeroInstrumento Actualizado!');

                        //} else {
                        // Actualizar
                        //await categoryProvider.updateCategory( id!, nombre );
                        //NotificationsService.showSnackbar('$nombre Actualizado!');
                      }

                      Navigator.of(context).pop();
                    } catch (e) {
                      Navigator.of(context).pop();
                      //NotificationsService.showSnackbarError('No se pudo guardar la categoría');
                    }
                  },
                  text: 'Guardar',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
            ]));
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Color.fromRGBO(55, 110, 219, 1),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
