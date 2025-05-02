import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik_2_0/config/helpers/human_formats.dart';
import 'package:toktik_2_0/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  
  const VideoButtons({
    super.key,
    required this.video
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Botones
          _CustomIconButton(value: video.likes, iconData: Icons.favorite, iconColor: Colors.red),
          const SizedBox(height: 20),

          _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined),
          const SizedBox(height: 20),
          SpinPerfect( //animacion de giro FernandoHerreraGOD
            infinite: true, //para que gire infinitamente
            duration: const Duration(seconds: 2), //duracion de la animacion
            child: const _CustomIconButton(value: 0, iconData: Icons.play_circle_outline)
            ),

      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  
  final int value;
  final IconData iconData;
  final Color? color;
    
  const _CustomIconButton({
      required this.value,
      required this.iconData,
      iconColor //color del icono, esto es una variable en el constructor
      //y aqui abajo se le asigna un valor por defecto
   }): color = iconColor ?? Colors.white; //si el color es nulo entonces es blanco


    @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: (){}, 
          icon: Icon(iconData, color: color, size: 30)),
        if( value > 0)
        Text( HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}