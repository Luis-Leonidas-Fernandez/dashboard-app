import 'package:admin_dashboard/models/http/administrados_all.dart';
import 'package:admin_dashboard/providers/files_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdministradoModalUpdate extends StatefulWidget {
  final Administrado? administrado;

  AdministradoModalUpdate({Key? key, this.administrado}) : super(key: key);

  @override
  State<AdministradoModalUpdate> createState() =>
      _AdministradoModalUpdateState();
}

class _AdministradoModalUpdateState extends State<AdministradoModalUpdate> {
  late String apellidos = '';
  late String nombres = '';
  late String jerarquia = '';
  late int plaza = 0;
  int dni = 0;

  @override
  void initState() {
    super.initState();

    dni = widget.administrado?.dni ?? 0;
    apellidos = widget.administrado?.apellidos ?? '';
    nombres = widget.administrado?.nombres ?? '';
    jerarquia = widget.administrado?.jerarquia ?? '';
    plaza = widget.administrado?.plaza ?? 0;
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
                      'Actualizar Administrado',
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
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.dni.toString(),
                        onChanged: (value) => dni = int.parse(value),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'DNI',
                            label: 'DNI del Empleado',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 40,
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.apellidos.toString(),
                        onChanged: (value) => apellidos = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Apellidos',
                            label: 'Apellidos',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 40,
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.nombres,
                        onChanged: (value) => nombres = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Nombres',
                            label: 'Nombres',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 40,
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.jerarquia,
                        onChanged: (value) => jerarquia = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Jerarquia',
                            label: 'Jerarquia',
                            icon: Icons.person),
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 40,
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.plaza.toString(),
                        onChanged: (value) => plaza = int.parse(value),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Plaza', label: 'Plaza', icon: Icons.person),
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
                    await fileService.buildAdministrado(
                        apellidos, nombres, jerarquia, plaza, dni);
                    NotificationsService.showSnackbar(
                        '$apellidos $nombres creado!');

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
                      'Registrar Administrado',
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
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.dni.toString(),
                        onChanged: (value) => dni = int.parse(value),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'DNI',
                            label: 'DNI del Empleado',
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
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.apellidos,
                        onChanged: (value) => apellidos = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Apellidos',
                            label: 'Apellidos',
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
                  width: 300,
                  child: TextFormField(
                      cursorColor: Colors.white,
                      initialValue: widget.administrado?.nombres,
                      onChanged: (value) => nombres = value,
                      decoration: CustomInputs.loginInputDecoration(
                          hint: 'Nombres',
                          label: 'Nombres',
                          icon: Icons.person),
                      style: TextStyle(color: Colors.white)),
                ),
              ]),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 40,
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.jerarquia,
                        onChanged: (value) => jerarquia = value,
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Jerarquia',
                            label: 'Jerarquia',
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
                    width: 300,
                    child: TextFormField(
                        cursorColor: Colors.white,
                        initialValue: widget.administrado?.plaza.toString(),
                        onChanged: (value) => plaza = int.parse(value),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Plaza', label: 'Plaza', icon: Icons.person),
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
                    try {
                      {
                        // Crear
                        await fileService.buildAdministrado(
                            apellidos, nombres, jerarquia, plaza, dni);
                        //NotificationsService.showSnackbar('$nombre creado!');

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
