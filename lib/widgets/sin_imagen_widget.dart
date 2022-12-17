import 'package:fl_mis_vacunas/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SinImagenWidget extends StatelessWidget {
  final bool mostrarTexto;
  const SinImagenWidget({super.key, this.mostrarTexto = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/sin_imagen.png', fit: BoxFit.contain),
        if (mostrarTexto)
          Expanded(
            child: TextModelWidget.texto(
              texto: 'Imagen no Disponible',
              tipoFuente: FontWeight.w600,
              tamanioTexto: 14,
            ),
          )
      ],
    );
  }
}
