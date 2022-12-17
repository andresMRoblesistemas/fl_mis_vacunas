import 'package:fl_mis_vacunas/widgets/tarjetas_apiladas_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_mis_vacunas/widgets/splash_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        //home: const Splash());
        home: const UltimasDosisWidget());
  }
}