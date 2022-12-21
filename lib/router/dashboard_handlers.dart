import 'package:admin_dashboard/ui/views/views.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

/* import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart'; */

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });

  static Handler icons = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return IconsView();
    else
      return LoginView();
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return BlankView();
    else
      return LoginView();
  });
  static Handler reubicaciones =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.reubicacionesRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return ReubicacionesView();
    else
      return LoginView();
  });

  static Handler reconocimiento =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.reconocimientoRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return ReconocimientoView();
    else
      return LoginView();
  });

  static Handler transferencia =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.transferenciaRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return TransferenciaView();
    else
      return LoginView();
  });

  static Handler habilitarInhabilitar =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.habilitarInhabilitarRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return HabilitacionesView();
    else
      return LoginView();
  });

  static Handler recursos =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.recursosRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return RecursosView();
    else
      return LoginView();
  });

  static Handler permanenciaGrado =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.permanenciaGradoRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return PermanenciaView();
    else
      return LoginView();
  });

  static Handler prontoDespacho =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.prontoDespachoRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return ProntoDespachoView();
    else
      return LoginView();
  });

  static Handler oficios =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.oficiosRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return OficiosView();
    else
      return LoginView();
  });

  static Handler reservaVacante =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.reservaVacanteRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return ReservaVacanteView();
    else
      return LoginView();
  });

  static Handler demanda =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.demandaRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return DemandaView();
    else
      return LoginView();
  });

  static Handler amparo =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.amparoRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return AmparoView();
    else
      return LoginView();
  });

  static Handler otros =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.otrosRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return OtrosView();
    else
      return LoginView();
  });

  static Handler promocionAnual =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.promocionAnualRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return PromocionAnualView();
    else
      return LoginView();
  });

  static Handler meritoExtraordinario =
      new Handler(handlerFunc: (context, Map<String, dynamic> paramas) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.meritoExtraordinarioRoute);

    
      if (authProvider.authStatus == AuthStatus.authenticated)
      return MeritoExtraordinarioView();
    else
      return LoginView();
  });
}
