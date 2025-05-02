import 'package:flutter/material.dart';
import 'package:toktik_2_0/presetation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScrenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;


  const FullScrenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption
  });

  @override
  State<FullScrenPlayer> createState() => _FullScrenPlayerState();
}

class _FullScrenPlayerState extends State<FullScrenPlayer> {
  
  late VideoPlayerController controller;

  @override
  void initState() {

    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl) //cargar video
      ..setVolume(0) //silenciar video
      ..setLooping(true) //repetir video
      ..play(); //reproducir video
      
  }

  @override
  void dispose() {

    controller.dispose(); //liberar recursos
    super.dispose(); //liberar recursos
  }
  
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: controller.initialize(), //inicializar el video ,
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done){ //si la conexion no esta hecha
          return const Center (
            //mientras se carga el video mostrar un circulo de carga
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.teal) ); 
        } 
        return GestureDetector(
          onTap:() {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            } 
    
            controller.play();
          },
          child: AspectRatio(
            
            aspectRatio: controller.value.aspectRatio  , //aspect ratio segun el video 
            child: Stack(
              children: [
                VideoPlayer(controller),

                //Gradiente
                VideoBackground(
                  stops: const [0.8,1.0],
                ),
        
                //Caption
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption)
                ),
              ],
            
            ),
          ),
        );
      },

    
    );
  }
}

class _VideoCaption extends StatelessWidget {
  
  final String caption;
  const _VideoCaption({
    
    required this.caption

  });

  
  @override
  Widget build(BuildContext context) {
    final tamanio = MediaQuery.of(context).size; //tamaño de la pantalla para el caption
    final titleStyle = Theme.of(context).textTheme.titleMedium; //estilo del captiontitulo

    return SizedBox(
      width: tamanio.width*0.6, //60% del ancho de la pantalla
      child: Text(caption, maxLines: 2, style:titleStyle )
    );
  }
}