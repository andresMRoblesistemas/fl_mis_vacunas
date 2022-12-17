import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fl_mis_vacunas/global/environment.dart';
import 'package:fl_mis_vacunas/widgets/sin_imagen_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utilidades {
  static String utf8convert(String text) {
    String resultado = '';
    List<int> bytes = text.toString().codeUnits;
    try {
      resultado = utf8.decode(bytes);
    } catch (e) {
      resultado = String.fromCharCodes(bytes);
    }
    // resultado = resultado.replaceAll('<p>', '');
    return resultado;
  }

  static Future<String> imagenCover(String urlImagen) async {
    Size dimenciones = await _calculateImageDimension(urlImagen);
    double alto = dimenciones.height;
    double ancho = dimenciones.width;
    if (alto * 1.5 < ancho) {
      return 'S';
    } else {
      return 'N';
    }
  }

  static Future<Size> _calculateImageDimension(String urlImagen) {
    Completer<Size> completer = Completer();
    Image image = Image.network(urlImagen);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  ///Esta funcion compara 2 mapas generando uno nuevo con los datos que
  ///fueron modificados o agregados en el mapaActualizado
  ///como paramentro opcional recive keyExcluir que se si indica el key
  ///del mapaActualizado no es tenido encuenta
  ///se utiliza la libreria [collection] para poder utilizar la funcion
  ///ListEquality y comprar 2 listas
  static Map<String, dynamic> newMap(
      {required Map<String, dynamic> mapaOriginal,
      required Map<String, dynamic> mapaActualizado,
      List<String>? lstKeyExcluir}) {
    try {
      final Map<String, dynamic> newMap = {};
      mapaActualizado.forEach((key, value) {
        if (lstKeyExcluir == null || !lstKeyExcluir.contains(key)) {
          bool iguales = false;
          if (mapaOriginal.containsKey(key)) {
            if (value is List) {
              iguales = const ListEquality().equals(mapaOriginal[key], value);
            } else {
              iguales = mapaOriginal[key] == value;
            }
          }
          if (!iguales) {
            newMap.putIfAbsent(key, () => value);
          }
        }
      });
      return newMap;
    } catch (e) {
      return {};
    }
  }

  static String formateaCreadoEl({required String creadoEl}) {
    String newCreadoEl = '';
    try {
      if (creadoEl.isNotEmpty && creadoEl.length > 12) {
        newCreadoEl =
            '${creadoEl.substring(6, 8)}-${creadoEl.substring(4, 6)}-${creadoEl.substring(0, 4)}  ${creadoEl.substring(8, 10)}:${creadoEl.substring(10, 12)}hs';
      }
    } catch (e) {
      return '';
    }
    return newCreadoEl;
  }

  static String formateaFechaNotificacion({required String creadoEl}) {
    String newCreadoEl = '';
    try {
      if (creadoEl.isNotEmpty && creadoEl.length > 12) {
        newCreadoEl =
            '${creadoEl.substring(8, 10)}/${creadoEl.substring(5, 7)}/${creadoEl.substring(0, 4)}';
      }
    } catch (e) {
      return '';
    }
    return newCreadoEl;
  }

  ///Fecha de tipo String con el formato DD/MM/AAAA
  static String formatearFechaNotificacionGuardar({required String creadoEl}) {
    String newCreadoEl = '';
    try {
      if (creadoEl.length == 10) {
        newCreadoEl =
            '${creadoEl.substring(6, 10)}${creadoEl.substring(3, 5)}${creadoEl.substring(0, 2)}';
      }
    } catch (e) {
      return '';
    }
    return newCreadoEl;
  }

  static Widget determinarImagen(
      {required ImagenModel imagen,
      required BoxFit fit,
      bool? mostrarTexto = true,
      VoidCallback? onPressed}) {
    if (imagen.urlDispositivo.isEmpty &&
        (imagen.urlDefecto == null || imagen.urlDefecto!.isEmpty)) {
      return SinImagenWidget(mostrarTexto: mostrarTexto!);
    }
    final String url = _determinarUrlImagen(
        url: imagen.urlDispositivo, urlDefecto: imagen.urlDefecto ?? '');
    switch (_determinarFuenteImagen(url: url)) {
      case FuenteImagen.asset:
        return Image.asset(url, fit: fit);

      case FuenteImagen.network:
        return FadeInImage.assetNetwork(
            placeholder: 'assets/animacion_carga.gif',
            image: url,
            fit: fit,
            imageErrorBuilder: (context, error, stackTrace) {
              log('ERRRRRRRRRRROOOOOOOOR $error >>>>$stackTrace');

              return SinImagenWidget(mostrarTexto: mostrarTexto!);
            });

      case FuenteImagen.file:
        return Image.file(File(url), fit: fit);
    }
  }

  static String _determinarUrlImagen(
      {required String url, required String urlDefecto}) {
    if (url == Environment.imgSinDownLoad) {
      return urlDefecto;
    } else if (url.isEmpty) {
      return urlDefecto;
    } else if (url == Environment.imgErrDownLoad) {
      return urlDefecto;
    } else if (url.startsWith('assets/')) {
      return url;
    } else {
      return url;
    }
  }

  static FuenteImagen _determinarFuenteImagen({required String url}) {
    if (url == Environment.imgSinDownLoad) {
      return FuenteImagen.network;
    } else if (url.isEmpty) {
      return FuenteImagen.network;
    } else if (url == Environment.imgErrDownLoad) {
      return FuenteImagen.network;
    } else if (url.startsWith('assets/')) {
      return FuenteImagen.asset;
    } else if (url.startsWith('https') || url.startsWith('http')) {
      return FuenteImagen.network;
    } else {
      return FuenteImagen.file;
    }
  }

  static DateTime verificarFechaValida(String date, String formatoFecha) {
    if (DateTime.tryParse(date.replaceAll('/', '')) == null) {
      return DateTime.now();
    }
    try {
      DateTime fecha = DateFormat(formatoFecha).parse(date);

      return fecha;
    } catch (e) {
      return DateTime.now();
    }
  }

  static DateTime obtenerFechaMaxima(
      {required DateTime fecha1, required DateTime fecha2}) {
    try {
      return fecha1.isAfter(fecha2) ? fecha2 : fecha1;
    } catch (e) {
      return DateTime.now();
    }
  }

  ///[fecha] DD/MM/AAAA o AAAA/MM/DD, [formatoOriginal] DD/MM/AAAA o AAAA/MM/DD
  ///[formatoDestino] DD/MM/AAAA o AAAA/MM/DD
  ///toma la fecha y la pasa al nuevo formato respetando 2 posiciones para dia/mes
  ///el separador debe ser (/)
  static Map<String, dynamic> invierteformatoFecha(
      String fecha, String formatoOriginal, String formatoDestino) {
    try {
      if (fecha.isEmpty) {
        return {'status': false, 'error': 'la fecha se encuentra vacia'};
      }
      bool contieneSeparado = false;
      if (fecha.contains('/')) {
        contieneSeparado = true;
      }
      if (!contieneSeparado) {
        return {
          'status': false,
          'error': 'la fecha no posee como separado (/)'
        };
      }
      int day = 0, month = 0, year = 0, fechaInt;
      String fechaText = '';
      final arregloFecha = fecha.split('/');
      if (formatoOriginal.substring(1, 2) == 'D') {
        day = int.tryParse(arregloFecha[0]) ?? 0;
        month = int.tryParse(arregloFecha[1]) ?? 0;
        year = int.tryParse(arregloFecha[2]) ?? 0;
      } else {
        day = int.tryParse(arregloFecha[2]) ?? 0;
        month = int.tryParse(arregloFecha[1]) ?? 0;
        year = int.tryParse(arregloFecha[0]) ?? 0;
      }

      if (formatoDestino.substring(1, 2) == 'D') {
        fechaInt = int.tryParse(
                '${day.toString().padLeft(2, '0')}${month.toString().padLeft(2, '0')}$year') ??
            0;
        fechaText =
            '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
      } else {
        fechaInt = int.tryParse(
                '$year${month.toString().padLeft(2, '0')}${day.toString().padLeft(2, '0')}') ??
            0;
        fechaText =
            '$year/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
      }
      return {'status': true, 'fechaInt': fechaInt, 'fechaText': fechaText};
    } catch (e) {
      return {'status': false};
    }
  }
}

enum FuenteImagen { asset, network, file }

class ImagenModel {
  final String urlDispositivo;
  final String? urlDefecto;
  final bool utilizaDatosMoviles;

  ImagenModel(
      {required this.urlDispositivo,
      this.urlDefecto,
      this.utilizaDatosMoviles = false});
}
