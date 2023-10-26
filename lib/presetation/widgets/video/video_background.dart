import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  const VideoBackground({
    
    super.key,
    this.colors = const [
      Colors.transparent,
      Colors.black87
    ],
    this.stops = const [0.0, 1.0]
    }) : assert(colors.length == stops.length, 'colors and stops length must be same length');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill( //posicionar el gradiente en toda la pantalla
      child: DecoratedBox( //decorar la caja con el gradiente
        decoration: BoxDecoration( //decoracion del gradiente
          gradient: LinearGradient( //gradiente lineal
            colors: colors, //colores del gradiente
            stops: stops,
            begin: Alignment.topCenter, //inicio del gradiente
            end: Alignment.bottomCenter //fin del gradiente
          )
         ,
        )
      )
    );
  }
}