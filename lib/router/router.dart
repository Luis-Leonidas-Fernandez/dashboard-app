import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/admin_handlers.dart';

class Flurorouter {

  static final FluroRouter router = new FluroRouter();

  static String rootRoute     = '/';

  // Auth Router
  static String loginRoute    = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';

  // Mis Rutas
  static String reubicacionesRoute = '/dashboard/reubicaciones';
  static String reconocimientoRoute = '/dashboard/reconocimiento';
  static String transferenciaRoute = '/dashboard/transferencia';
  static String habilitarInhabilitarRoute = '/dashboard/habilitarInhabilitar';
  static String recursosRoute = '/dashboard/recursos';
  static String permanenciaGradoRoute = '/dashboard/permanencia Grado';
  static String prontoDespachoRoute = '/dashboard/prontoDespacho';
  static String oficiosRoute = '/dashboard/oficios';
  static String reservaVacanteRoute = '/dashboard/reservaVacante';
  static String meritoExtraordinarioRoute = '/dashboard/meritoExtraordinario';
  static String demandaRoute = '/dashboard/demanda';
  static String amparoRoute = '/dashboard/amparo';
  static String otrosRoute = '/dashboard/otros';
  static String promocionAnualRoute = '/dashboard/promocionAnual';


  static void configureRoutes() {
    // Auth Routes
    router.define( rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    router.define( loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    router.define( registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none );

    // Dashboard
    router.define( dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn );
    router.define( iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.fadeIn );
    router.define( blankRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.fadeIn );

    //Custom Rutas
    router.define(reubicacionesRoute,
        handler: DashboardHandlers.reubicaciones,
        transitionType: TransitionType.fadeIn);

    router.define(reconocimientoRoute,
        handler: DashboardHandlers.reconocimiento,
        transitionType: TransitionType.fadeIn);

    router.define(transferenciaRoute,
        handler: DashboardHandlers.transferencia,
        transitionType: TransitionType.fadeIn);

    router.define(habilitarInhabilitarRoute,
        handler: DashboardHandlers.habilitarInhabilitar,
        transitionType: TransitionType.fadeIn);

    router.define(recursosRoute,
        handler: DashboardHandlers.recursos,
        transitionType: TransitionType.fadeIn);

    router.define(permanenciaGradoRoute,
        handler: DashboardHandlers.permanenciaGrado,
        transitionType: TransitionType.fadeIn);

    router.define(prontoDespachoRoute,
        handler: DashboardHandlers.prontoDespacho,
        transitionType: TransitionType.fadeIn);

    router.define(oficiosRoute,
        handler: DashboardHandlers.oficios,
        transitionType: TransitionType.fadeIn);

    router.define(reservaVacanteRoute,
        handler: DashboardHandlers.reservaVacante,
        transitionType: TransitionType.fadeIn);

    router.define(meritoExtraordinarioRoute,
        handler: DashboardHandlers.meritoExtraordinario,
        transitionType: TransitionType.fadeIn);

    router.define(demandaRoute,
        handler: DashboardHandlers.demanda,
        transitionType: TransitionType.fadeIn);

    router.define(amparoRoute,
        handler: DashboardHandlers.amparo,
        transitionType: TransitionType.fadeIn);

    router.define(otrosRoute,
        handler: DashboardHandlers.otros,
        transitionType: TransitionType.fadeIn);

    router.define(promocionAnualRoute,
        handler: DashboardHandlers.promocionAnual,
        transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

  }
}

