import 'package:fl_mis_vacunas/global/theme.dart';
import 'package:fl_mis_vacunas/utils/responsive_wrapper_utils.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TextModelWidget extends StatelessWidget {
  final String texto;
  final double? tamanioTexto;
  final Color? colorTexto;
  final TextStyle estilo;
  final int? maxlineas;
  final TextOverflow? overflow;
  final TextAlign? alineacion;
  final FontWeight? tipoFuente;
  final bool? ocultarTexto;

  const TextModelWidget({
    super.key,
    required this.texto,
    this.tamanioTexto,
    this.colorTexto,
    required this.estilo,
    this.maxlineas,
    this.overflow = TextOverflow.ellipsis,
    this.alineacion,
    this.tipoFuente, 
    this.ocultarTexto = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Text(
        (ocultarTexto!) ?  '***************' : texto,
        maxLines: maxlineas,
        overflow: overflow,
        textAlign: alineacion,
        style: estilo.copyWith(color: colorTexto, fontSize: tamanioTexto, fontWeight: tipoFuente),
      ),
    );
  }

  factory TextModelWidget.titulo(
      {double tamanioTexto,
      required String texto,
      Color colorTexto,
      FontWeight tipoFuente,
      TextStyle? estilo,
      int? maxlineas,
      bool? ocultarTexto}) = _TextTituloModelWidget;

  factory TextModelWidget.subtitulo({
    double tamanioTexto,
    required String texto,
    Color? colorTexto,
    FontWeight tipoFuente,
    TextStyle? estilo,
    int maxlineas,
  }) = _TextSubtituloModelWidget;

  factory TextModelWidget.texto({
    double tamanioTexto,
    required String texto,
    Color? colorTexto,
    FontWeight tipoFuente,
    int maxlineas,
    TextAlign? alineacion,
    TextStyle? estilo,
    TextOverflow? overflow,
  }) = _TextTextoModelWidget;
  factory TextModelWidget.textoLink({
    double tamanioTexto,
    required String texto,
    Color? colorTexto,
    FontWeight tipoFuente,
    int maxlineas,
    TextAlign? alineacion,
    TextStyle? estilo,
  }) = _TextTextoLinkModelWidget;
  factory TextModelWidget.textoError({
    double tamanioTexto,
    required String texto,
    Color colorTexto,
    FontWeight tipoFuente,
    int maxlineas,
    TextAlign? alineacion,
    TextStyle? estilo,
  }) = _TextErrorModelWidget;

  factory TextModelWidget.textoLogo({
    double tamanioTexto,
    required String texto,
    Color colorTexto,
    FontWeight tipoFuente,
    int maxlineas,
    TextAlign? alineacion,
    TextStyle? estilo,
  }) = _TextTextoLogoWidget;
}

class _TextTextoModelWidget extends TextModelWidget {
  _TextTextoModelWidget({
    required super.texto,
    super.tamanioTexto = tamanoTexto1,
    Color? colorTexto = Colors.black87,
    super.tipoFuente = FontWeight.w400,
    int maxlineas = 2,
    super.alineacion = TextAlign.left,
    TextStyle? estilo,
    TextOverflow? overflow,
  }) : super(
            overflow: overflow,
            maxlineas: maxlineas,
            estilo: estilo ??
                fuentePrincipal.copyWith(
                  color: colorTexto,
                  fontSize: tamanioTexto,
                  fontWeight: tipoFuente,
                ));
}

class _TextTextoLinkModelWidget extends TextModelWidget {
  _TextTextoLinkModelWidget({
    required super.texto,
    super.tamanioTexto = tamanoTexto1,
    Color? colorTexto,
    super.tipoFuente = FontWeight.w400,
    int? maxlineas = 1,
    super.alineacion = TextAlign.left,
    TextStyle? estilo,
  }) : super(
            estilo: estilo ??
                fuentePrincipal.copyWith(
                  decoration: TextDecoration.underline,
                  color: colorTexto ?? const Color(0xff3367D6),
                  fontSize: tamanioTexto,
                  fontWeight: tipoFuente,
                ),
            maxlineas: maxlineas);
}

class _TextErrorModelWidget extends TextModelWidget {
  _TextErrorModelWidget({
    required super.texto,
    super.tamanioTexto = tamanoTexto1,
    super.colorTexto = Colors.red,
    super.tipoFuente = FontWeight.w500,
    super.maxlineas = 2,
    super.alineacion = TextAlign.left,
    TextStyle? estilo,
  }) : super(
            estilo: estilo ??
                fuentePrincipal.copyWith(
                  color: colorTexto,
                  fontSize: tamanioTexto,
                  fontWeight: tipoFuente,
                ));
}

class _TextSubtituloModelWidget extends TextModelWidget {
  _TextSubtituloModelWidget({
    required super.texto,
    super.tamanioTexto = tamanoTexto2,
    Color? colorTexto,
    super.tipoFuente = FontWeight.w500,
    int maxlineas = 1,
    TextStyle? estilo,
  }) : super(
            colorTexto: colorTexto ?? const Color(0xff5F6368),
            maxlineas: maxlineas,
            estilo: estilo ??
                fuentePrincipal.copyWith(
                  color: colorTexto,
                  fontSize: tamanioTexto,
                  fontWeight: tipoFuente,
                ));
}

class _TextTituloModelWidget extends TextModelWidget {
  _TextTituloModelWidget({
    required super.texto,
    super.tamanioTexto = tamanoTexto7,
    int? maxlineas,
    super.ocultarTexto,
    super.colorTexto = colorMarron,
    super.tipoFuente = FontWeight.bold,
    TextStyle? estilo,
  }) : super(
          maxlineas: maxlineas,
          estilo: estilo ??
              fuentePrincipal.copyWith(
                color: colorTexto,
                fontSize: tamanioTexto,
                fontWeight: tipoFuente,
              ),
        );
}

class TextTituloWidget extends StatelessWidget {
  final String texto;

  const TextTituloWidget({super.key, required this.texto});
  @override
  Widget build(BuildContext context) {
    return TextModelWidget.titulo(
      texto: texto,
      maxlineas: 3,
      tamanioTexto: context.tamanoParaDispositivo(desktop: tamanoTexto5, phone: tamanoTexto3),
    );
  }
}

class _TextTextoLogoWidget extends TextModelWidget {
  _TextTextoLogoWidget({
    required super.texto,
    super.tamanioTexto = tamanoTexto5,
    Color? colorTexto,
    super.tipoFuente = FontWeight.w400,
    super.maxlineas = 1,
    super.alineacion = TextAlign.left,
    TextStyle? estilo,
  }) : super(
            colorTexto: colorTexto ?? const Color(0xff757575),
            estilo: estilo ??
                GoogleFonts.workSans().copyWith(
                  color: colorTexto,
                  fontSize: tamanioTexto,
                  fontWeight: tipoFuente,
                ));
}
