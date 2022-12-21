import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/menu_items.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);

    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50),
          TextSeparator(text: 'Inicio'),
          MenuItems(
            text: 'Data Base',
            icon: Icons.home,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),
          MenuItems(
            text: 'Administrados',
            icon: Icons.file_open_outlined,
            onPressed: () => navigateTo(Flurorouter.reubicacionesRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.reubicacionesRoute,
          ),
          MenuItems(
            text: 'Instrumentos',
            icon: Icons.punch_clock,
            onPressed: () => navigateTo(Flurorouter.reconocimientoRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.reconocimientoRoute,
          ),
          MenuItems(
            text: 'Transferencia',
            icon: Icons.move_up_outlined,
            onPressed: () => navigateTo(Flurorouter.transferenciaRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.transferenciaRoute,
          ),
          MenuItems(
            text: 'Habilitar-Inhabilitar',
            icon: Icons.analytics_sharp,
            onPressed: () => navigateTo(Flurorouter.habilitarInhabilitarRoute),
            isActive: sideMenuProvider.currentPage ==
                Flurorouter.habilitarInhabilitarRoute,
          ),
          MenuItems(
            text: 'Recursos',
            icon: Icons.file_present,
            onPressed: () => navigateTo(Flurorouter.recursosRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.recursosRoute,
          ),
          MenuItems(
            text: 'Permanencia Grado',
            icon: Icons.money_off,
            onPressed: () => navigateTo(Flurorouter.permanenciaGradoRoute),
            isActive: sideMenuProvider.currentPage ==
                Flurorouter.permanenciaGradoRoute,
          ),
          MenuItems(
            text: 'Pronto Despacho',
            icon: Icons.book,
            onPressed: () => navigateTo(Flurorouter.prontoDespachoRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.prontoDespachoRoute,
          ),
          MenuItems(
            text: 'Oficios',
            icon: Icons.person_add,
            onPressed: () => navigateTo(Flurorouter.oficiosRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.oficiosRoute,
          ),
          MenuItems(
            text: 'Reserva Vacante',
            icon: Icons.book_online_outlined,
            onPressed: () => navigateTo(Flurorouter.reservaVacanteRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.reservaVacanteRoute,
          ),
          MenuItems(
            text: 'Mert. Extraordinario',
            icon: Icons.file_copy_sharp,
            onPressed: () => navigateTo(Flurorouter.meritoExtraordinarioRoute),
            isActive: sideMenuProvider.currentPage ==
                Flurorouter.meritoExtraordinarioRoute,
          ),
          MenuItems(
            text: 'Demanda',
            icon: Icons.content_paste_search,
            onPressed: () => navigateTo(Flurorouter.demandaRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.demandaRoute,
          ),
          MenuItems(
            text: 'Amparo',
            icon: Icons.content_paste_go_sharp,
            onPressed: () => navigateTo(Flurorouter.amparoRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.amparoRoute,
          ),
          MenuItems(
            text: 'Otros',
            icon: Icons.file_copy_sharp,
            onPressed: () => navigateTo(Flurorouter.otrosRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.otrosRoute,
          ),
          MenuItems(
            text: 'Promocion Anual',
            icon: Icons.local_police_rounded,
            onPressed: () => navigateTo(Flurorouter.promocionAnualRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.promocionAnualRoute,
          ),
          SizedBox(height: 40),
          TextSeparator(text: 'Salida'),
          MenuItems(
              text: 'Cerrar sesión',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: (Colors.indigo),
      boxShadow: [BoxShadow(color: Colors.black87, blurRadius: 13)]);
}
