import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xff121111),
  secondaryHeaderColor: const Color(0xff2D2D2D),
  primaryColor: colorPrimario,
  colorScheme: const ColorScheme.dark().copyWith(
      secondary: const Color(0xff4285F4), primary: const Color(0xff4285F4)),
  focusColor: const Color(0xffE1E1E1),
  iconTheme: const IconThemeData(color: Color(0xff4285F4)),
  textTheme: TextTheme(
      headline6: estiloTitulo2Dark,
      headline5: estiloSubTituloDark,
      headline4: estiloTitulo1Dark),
);

final lightTheme = ThemeData(
    // scaffoldBackgroundColor: const Color(0xffF1F2F7),
    scaffoldBackgroundColor: Colors.white,
    secondaryHeaderColor: Colors.white,
    primaryColor: colorVerde,
    backgroundColor: colorVerde,
    
    colorScheme: const ColorScheme.light()
        .copyWith(secondary: colorPrimario, primary: colorPrimario),
    iconTheme: const IconThemeData(color: Color(0xff10B285)),
    textTheme: TextTheme(
        headline6: estiloTitulo2Ligth,
        headline5: estiloSubTituloLigth,
        headline4: estiloTitulo1Ligth));
const colorPrimario = colorAzul;
const colorMarron = Color.fromRGBO(91, 80, 72, 1);
const colorSegundario = Color(0xfff3dfdd);
const colorMenu = Color.fromARGB(255, 52, 73, 85);
const contrasteFondo = colorBlanco;
final estiloTitulo1Dark = fuentePrincipal.copyWith(color: Colors.white);
final estiloTitulo2Dark =
    fuentePrincipal.copyWith(color: const Color(0xff3367D6), fontSize: 12);
final estiloSubTituloDark = GoogleFonts.workSans()
    .copyWith(color: const Color(0xffE1E1E1).withOpacity(0.5));

final estiloTitulo1Ligth = fuentePrincipal.copyWith(color: Colors.black87);
final estiloTitulo2Ligth = fuentePrincipal.copyWith(
    color: const Color(0xff4285F4).withOpacity(0.7), fontSize: 12);
final estiloSubTituloLigth =
    fuentePrincipal.copyWith(color: Colors.black.withOpacity(0.35));
final TextStyle fuentePrincipal = GoogleFonts.workSans();

const Color colorRojo = Color.fromRGBO(255, 60, 50, 1);
const Color colorBlanco = Color.fromRGBO(237, 232, 228, 1);
const Color colorAzul = Color.fromRGBO(98, 138, 217, 1);
const Color colorVerde = Color.fromARGB(255, 16,178,133);

///tamaño 8
const double tamanoTexto0 = 8;

///tamaño 10
const double tamanoTexto1 = 10;

///tamaño11
const double tamanoTexto2 = 11;

///tamaño12
const double tamanoTexto3 = 12;

///tamaño 14
const double tamanoTexto4 = 14;

///tamaño 18
const double tamanoTexto5 = 18;

///tamaño 20
const double tamanoTexto6 = 20;

///tamaño 22
const double tamanoTexto7 = 22;
