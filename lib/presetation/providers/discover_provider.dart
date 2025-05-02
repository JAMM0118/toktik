
import 'package:flutter/material.dart';
import 'package:toktik_2_0/domain/entities/video_post.dart';
import 'package:toktik_2_0/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videosRepository; //importar el repositorio

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
    
    }); 

  Future<void> loadNextPage() async{

    //await Future.delayed(const Duration(seconds: 2));

    /*final List<VideoPost> newVideos = videoPosts.map( //conversion de LocalVideoModel a VideoPost
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()  
      //con esto reproducimos los videos locales de la carpeta assets/videos y los convertimos en VideoPost
      //no se le olvide agregar el archivo local_video_post.dart en la carpeta shared/data
    
    ).toList(); //conversion de List<LocalVideoModel> a List<VideoPost>
*/
  final newVideos = await videosRepository.getTrendigVideosByPage(1); //obtener los videos del repositorio   

    videos.addAll(newVideos); //agregar los nuevos videos a la lista de videos
    initialLoading = false; //cambiar el estado de initialLoading a false

    notifyListeners();
  }
}