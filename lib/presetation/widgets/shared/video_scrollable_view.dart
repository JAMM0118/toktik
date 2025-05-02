import 'package:flutter/material.dart';
import 'package:toktik_2_0/domain/entities/video_post.dart';
import 'package:toktik_2_0/presetation/widgets/shared/video_buttons.dart';
import 'package:toktik_2_0/presetation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  
  final List<VideoPost> videos;
  
  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    
    return PageView.builder( // hace que se pueda deslizar de un video a otro literal un pageView
      scrollDirection: Axis.vertical, //scroll vertical por defecto viene horizontal awesome incredible uff ohh
      physics: const BouncingScrollPhysics(), //efecto de rebote
      itemCount: videos.length, //cantidad de videos
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            //video player + gradiente
            SizedBox.expand( //expandir el video a todo el tamaño de la pantalla
              child: FullScrenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              )
            ),
            //FullScreenPlayer( video: videoPost),
            
            //Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost))
          ],
        );
      },

      
    );
  }
}
