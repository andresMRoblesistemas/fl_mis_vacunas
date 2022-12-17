import 'dart:math';
import 'package:fl_mis_vacunas/global/theme.dart';
import 'package:fl_mis_vacunas/utils/size.dart';
import 'package:fl_mis_vacunas/utils/utilidades.dart';
import 'package:fl_mis_vacunas/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class UltimasDosisWidget extends StatefulWidget {
  const UltimasDosisWidget({super.key});

  @override
  _UltimasDosisWidgetState createState() => _UltimasDosisWidgetState();
}

class _UltimasDosisWidgetState extends State<UltimasDosisWidget> {
  late ScrollController _scrollController;

  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final testCharacters = [
      ...characters,
    ];
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.blue, Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Información de vacunación'),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Utilidades.determinarImagen(imagen: ImagenModel(urlDispositivo: 'assets/enfermeras.png'), fit: BoxFit.fill),
                  ),
                  Container(
                    height: 200,
                    width: context.ancho*100,
                    color: Colors.blue.withOpacity(0.4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextModelWidget.texto(texto: 'Localidad:',
                          colorTexto: colorBlanco, tamanioTexto: tamanoTexto5,),
                          TextModelWidget.texto(texto: 'POSADAS',
                          colorTexto: colorBlanco, tamanioTexto: tamanoTexto3,),
                          TextModelWidget.texto(texto: 'Centro hospitalario:',
                          colorTexto: colorBlanco, tamanioTexto: tamanoTexto5,),
                          TextModelWidget.texto(texto: 'C.A.P.S Nº 8 ROCAMORA',
                          colorTexto: colorBlanco, tamanioTexto: tamanoTexto3,),
                          TextModelWidget.texto(texto: 'Vacuna seleccionada:',
                          colorTexto: colorBlanco, tamanioTexto: tamanoTexto5,),
                          TextModelWidget.texto(texto: 'IPV/SALK (Polio inyectable)',
                          colorTexto: colorBlanco, tamanioTexto: tamanoTexto3,),
                          TextModelWidget.texto(texto: 'Dosis:',
                          colorTexto: colorBlanco, tamanioTexto: tamanoTexto5,),
                          TextModelWidget.texto(texto: '1er Dosis',
                          colorTexto: colorBlanco, tamanioTexto: tamanoTexto3,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SliverAppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Ultimas dosis aplicadas',
                style: TextStyle(color: Colors.white),
              ),
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final character = testCharacters[index];

                  // hacky, we don't know the position of the SliverList
                  const double scrollAtLeast = 300;
                  const double animationRegion = 100;

                  final position = (index==testCharacters.length-1) ? index * 100  : index * 100;
                  final distanceTopTop = position - _offset + scrollAtLeast;
                  Offset translate = Offset.zero;
                  print("index $index $distanceTopTop");
                  if (distanceTopTop < animationRegion) {
                    translate = Offset(0, -distanceTopTop + animationRegion);
                  }

                  final double fadeAnimationValue = min(1, max(0, distanceTopTop / animationRegion));

                  return Transform.translate(
                    offset: translate,
                    child: Opacity(
                      opacity: fadeAnimationValue,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: (1 - fadeAnimationValue) * 60,
                        ),
                        child: SizedBox(
                          height: (index==testCharacters.length-1) ? 600 : 100,
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Transform.translate(
                                offset: const Offset(0, 20),
                                child: OverflowBox(
                                  minHeight: 140,
                                  maxHeight: (index==testCharacters.length-1) ? 600 : 140,
                                  child: Card(
                                    clipBehavior: Clip.none,
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    color: character.color!,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: (character.genero=='Masculino')
                                          ? const Icon(Icons.man, color: Colors.white, size: 50,)
                                          : (character.genero=='Femenino')
                                            ? const Icon(Icons.woman, color: Colors.white, size: 50,)
                                            : const Icon(Icons.person, color: Colors.white, size: 50,),
                                          ),
                                          
                                          
                                          Expanded(
                                            flex: 3,
                                            //width: context.ancho*70,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextModelWidget.texto(
                                                  texto: character.nombre!,
                                                  tamanioTexto: tamanoTexto7,
                                                  colorTexto: colorBlanco,
                                                ),
                                                TextModelWidget.texto(
                                                  texto: 'DNI: ${character.nroDocumento}',
                                                  colorTexto: colorBlanco,
                                                  tamanioTexto: tamanoTexto4,
                                                ),
                                                const SizedBox(height: 10,),
                                                TextModelWidget.texto(
                                                  texto: character.direccion!,
                                                  maxlineas: 3,
                                                  colorTexto: colorBlanco,
                                                  tamanioTexto: tamanoTexto4,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: (character.estado==1)
                                          ? const Icon(Icons.cloud_done_outlined, color: Colors.green,)
                                          : (character.estado==2)
                                            ? const Icon(Icons.cloud_off, color: Colors.grey,)
                                            : const Icon(Icons.cloud_off, color: Colors.red,),
                                          )
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: testCharacters.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Paciente {
  final String? genero;
  final String? nombre;
  final String? direccion;
  final int? nroDocumento;
  final int? estado;
  final Color? color;

  Paciente({
    this.genero,
    this.nombre,
    this.direccion,
    this.nroDocumento,
    this.estado,
    this.color,
  });
}

final characters = [
  Paciente(
    nombre: "Mercedes Samantha Liliana Liepzig",
    direccion:
        "Aliquip ullamco incididunt dolor aliqua ipsum incididunt sunt eiusmod aliquip ea.",
    genero: 'Femenino',
    color: Colors.blue.shade900,
    estado: 1,
    nroDocumento: 33333333
  ),
  Paciente(
    nombre: "Rodolfo Suarez",
    direccion:
        "Tu magna culpa cupidatat magna ea sunt magna occaecat mollit sunt commodo officia voluptate.",
    genero: 'Masculino',
    color: Colors.blue.shade800,
    estado: 2,
    nroDocumento: 34333533
  ),
  Paciente(
    nombre: "Ines Gutierrez",
    direccion:
        "Sint fugiat consectetur velit non exercitation officia.",
    genero: 'Femenino',
    color: Colors.blue.shade700,
    estado: 3,
    nroDocumento: 33333333
  ),
  Paciente(
    nombre: "Carlos Juarez",
    direccion: "Eiusmod irure elit aliquip magna reprehenderit tempor magna ad deserunt eu fugiat velit anim laboris.",
    genero: 'Masculino',
    color: Colors.blue.shade600,
    estado: 1,
    nroDocumento: 33333333
  ),
];