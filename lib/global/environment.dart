import 'package:encrypt/encrypt.dart';

class Environment {
  static String cdmEndpoint = "https://wifi.cdmisiones.net.ar";
  static String dataOk = 'Ok';
  static String dataNOk = 'NOk';
  static String dataInexistente = 'data inexistente';
  static String errorHttp = 'http_error';
  static String status = 'status';
  static String inStatus = 'inStatus';
  static String msgStatus = 'msgStatus';
  static String separador = ';';

  static String imgSinDownLoad = '#SinDownLoad';
  static String imgErrDownLoad = '#ErrDownLoad';
  static String literalNoAutorizado = 'No autorizado';
  static String literarIdColeccionIsar = 'idCDM';
  static String literalDataSinModificar = 'No hay informacion Modificada';

  //ENCRYPT
  final encryptKey = Key.fromUtf8('HolaEsteesMiKeydeProduccion??##@');
  final encryptIv = IV.fromLength(16);

  //Colecciones
  static String coleccionControladores = 'controladoresWifi';
  static String coleccioncampanas = 'campanas';
  static String coleccionRedes = 'redesWifi';
  static String coleccionEquipos = 'equiposWifi';
  static String coleccionUsuario = 'usuarios';
  static String coleccionNotificacionRedes = 'notificaciones';
  static String coleccionLog = 'log';

  static String coleccionSeguridad = 'coleccionSeguridad';
  static String coleccionSeguridadRedes = 'coleccionSeguridadRedes';

  ///Blocs
  ///Notificaciones_bloc
  static String blocOnNuevaNotificacion = 'OnNuevaNotificacion';
  static String blocOnEliminaNotificacion = 'OnEliminaNotificacion';

  ///InitproyectoBloc
  static String blocOnInitProyect = 'OnInitProyect';
  static String blocOnObtieneToken = 'OnObtieneToken';

  ///AuthBloc
  static String blocOnLoginAuth = 'OnLoginAuth';
  static String blocOnValidaDatosGuardadosAuth = 'OnValidaDatosGuardadosAuth';
  static String blocOnIniciaLoginAuth = 'OnIniciaLoginAuth';
  static String blocOnEventoUiAuth = 'EventoUiAuth';
  static String blocOnLogoutAuth = 'OnLogoutAuth';

  ///MenuBloc
  static String onSeleccionMenuEvent = 'OnSeleccionMenuEvent';
  static String onMostrarOcultarMenuEvent = 'OnMostrarOcultarMenuEvent';
  static String onEventoUiMenuEvent = 'OnEventoUiMenuEvent';

  ///ControladorBloc
  static String blocOnNuevoControlador = 'OnNuevoControlador';
  static String blocOnModificarControlador = 'OnModificarControlador';
  static String blocOnValidarControlador = 'OnValidarControlador';
  static String blocOnGuardarControlador = 'OnGuardarControlador';
  static String blocOnActualizaControlador = 'OnActualizaControlador';
  static String blocOnObtenerlstControladores = 'OnObtenerlstControladores';
  static String blocOnAgregarSitio = 'OnAgregarSitio';

  ///RedesBloc
  static String blocOnNuevaRed = 'OnNuevaRed';
  static String blocOnModificarRedes = 'OnModificarRedes';
  static String blocOnValidarRedes = 'OnValidarRedes';
  static String blocOnGuardarRedes = 'OnGuardarRedes';
  static String blocOnActualizaRed = 'OnActualizaRed';
  static String blocOnObtenerlstRedes = 'OnObtenerlstRedes';
  static String blocOnUploadImagenRed = 'OnUploadImagenRed';
  static String blocOnObtieneEquiposPorRedes = 'OnObtieneEquiposPorRedes';

  ///EquiposBloc
  static String blocOnNuevoEquipo = 'OnNuevoEquipo';
  static String blocOnModificarEquipo = 'OnModificarEquipo';
  static String blocOnValidarEquipo = 'OnValidarEquipo';
  static String blocOnGuardarEquipo = 'OnGuardarEquipo';
  static String blocOnActualizaEquipo = 'OnActualizaEquipo';
  static String blocOnObtenerlstEquipo = 'OnObtenerlstEquipo';
  static String blocOnObtenerDataPorControlador = 'OnObtenerDataPorControlador';
  static String blocOnAdoptarDispositovo = 'OnAdoptarDispositovo';
  static String blocOnFiltraEquiposPorRed = 'OnFiltraEquiposPorRed';

  ///EstadisticaBloc
  static String blocOnObtenerEstadistica = 'OnObtenerEstadistica';
  static String blocOnObtenerHistorialConexion = 'OnObtenerHistorialConexion';
  static String blocOnActualizaSeleccionTree = 'OnActualizaSeleccionTree';
  static String blocOnSeleccionarElementosTree = 'OnSeleccionarElementosTree';
  static String blocOnActualizaSeleccionLogConexionTree =
      'OnActualizaSeleccionLogConexionTree';

  ///UsuarioBloc
  static String blocOnNuevoUsuario = 'OnNuevoUsuario';
  static String blocOnModificarUsuario = 'OnModificarUsuario';
  static String blocOnValidarUsuario = 'OnValidarUsuario';
  static String blocOnGuardarUsuario = 'OnGuardarUsuario';
  static String blocOnObtenerlstUsuario = 'OnObtenerlstUsuario';
  static String blocOnleerUsuario = 'OnleerUsuario';
  static String blocOnActualizaEstadoUsuario = 'OnActualizaEstadoUsuario';
  static String blocOnBlanqueaContrasena = 'OnBlanqueaContrasena';

  ///CampañaBloc
  static String blocOnNuevoCampana = 'OnNuevoCampana';
  static String blocOnModificarCampana = 'OnModificarCampana';
  static String blocOnValidarCampana = 'OnValidarCampana';
  static String blocOnGuardarCampana = 'OnGuardarCampana';
  static String blocOnActualizaCampana = 'OnActualizaCampana';
  static String blocOnObtenerlstCampana = 'OnObtenerlstCampana';
  static String blocOnCargaImagenCampana = 'OnCargaImagenCampana';
  static String blocOnCambiaEstadoCampana = 'OnCambiaEstadoCampana';
  static String blocOnCambiaEstadoCampanaRed = 'OnCambiaEstadoCampanaRed';
  static String blocOnQuitarContenidoCampana = 'OnQuitarContenidoCampana';
  static String blocOnCargaImagenImagenPortada = 'OnCargaImagenImagenPortada';

  ///PermisoColeccionBloc
  static String blocOnInicializaPermisoColeccion =
      'OnInicializaPermisoColeccion';
  static String blocOnObtenerPermisoColeccion = 'OnObtenerPermisoColeccion';
  static String blocOnCambiaPermisoColeccion = 'OnCambiaPermisoColeccion';
  static String blocOnModificarPermisoColeccion = 'OnModificarPermisoColeccion';
  static String blocOnValidarPermisoColeccion = 'OnValidarPermisoColeccion';
  static String blocOnGuardarPermisoColeccion = 'OnGuardarPermisoColeccion';

  static String blocOnCambiaPermisoRed = 'OnCambiaPermisoRed';
  static String blocOnGuardarPermisoRed = 'OnGuardarPermisoRed';

  ///Tipo de usuario

  static String tipoUsuarioBase = 'U';
  static String tipoUsuarioSupervisos = 'S';
  static String tipoUsuarioAdministrador = 'A';

  ///Mapa_bloc
  static String blocOnSeleccionaUbicacion = 'OnSeleccionaUbicacion';
  static String blocOnGuardaUbicacion = 'blocOnGuardaUbicacion';
  static String blocOnInitMapa = 'OnInitMapa';
  static String blocOnMovioMapa = 'OnMovioMapa';
  static double latitudOrigen = -26.414541;
  static double longitudOrigen = -54.584995;
  static String blocOnAgregaMarcadorRed = 'OnAgregaMarcadorRed';
  static String blocOnQuitaMarcadorRed = 'OnQuitaMarcadorRed';
  static String blocOnNuevaUbicacionEvent = 'OnNuevaUbicacionEvent';

  static String estadoAltaRegistro = 'A';
  static String estadoBajaRegistro = 'B';
  static String estadoPendienteRegistro = 'W';
  static String estadoCampanaEdicion = 'E';
  static String estadoCampanaFinalizado = 'F';

  ///Key utilizados en los headers/bodys para las peticiones http
  static String cdmDesarrolloToken = 'cdmDesarrollo-token';
  static String secuenciaToken = 'token-refresh';
  static String coleccion = 'coleccion';
  static String coleccionOrigen = 'origen';
  static String idColeccion = 'idColeccion';
  static String dataKey = 'dataKey';
  static String estado = 'estado';
  static String resultado = 'resultado';

  static String consulta = 'consulta';
  static String ordenar = 'ordenar';
  static String limit = 'limit';
  static String skip = 'skip';
  static String concatenar = 'concatenar';
  static String idAppClient = 'idAppClient';
  static String destinoImagen = 'destinoImagen';
  static String destinoImagenPrivado = 'privado';
  static String destinoImagenPublico = 'publico';

  //indices menu
  static int indiceMenuDashboard = 0;
  static int indiceMenuConfiguraciones = 1;
  static int indiceMenuUsuarios = 12;
  static int indiceMenuUsuario = 13;
  static int indiceMenuCampana = 14;
  static int indiceMenuFichaCampana = 15;
  // static int indiceMenuEquipos = 2;
  // static int indiceMenuRed = 3;
  static int indiceMenuUbicacion = 2;
  static int indiceMenuFichaMapaRedes = 3;

  static List<String> lstMedidaTiempo = ['hora', 'dia'];
  static List<String> lstFabricantes = ['CAMBIUM', 'UBIQUITI'];
  static List<String> tipoStatusEquipo = ['online', 'offline'];
  static List<String> tipoAdaptadoEquipo = ['S', 'N'];

  static List<String> tipoCampana = ['web', 'socket'];

  static List<String> tipoContenido = ['imagen', 'video'];
  static List<String> tipoControladores = ['EndPoint', 'OnPremise', 'UDM Pro'];
  static List<String> tipoSeleccionRedesEquipos = [
    'todo',
    'online',
    'offline',
  ];
}
