import 'package:toktik_2_0/domain/datasources/video_posts_datasource.dart';
import 'package:toktik_2_0/domain/entities/video_post.dart';
import 'package:toktik_2_0/infrastructure/models/links_video_model.dart';
import '../../shared/data/links_video_post.dart';

class LinkVideoDataSource implements VideoPostDataSource{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendigVideosByPage(int page) async{
    
    //await Future.delayed(const Duration(seconds: 2));
    
     final List<VideoPost> newVideos = videoPosts.map( //conversion de LocalVideoModel a VideoPost
      (video) => LinkVideoModel.fromJson(video).toVideoPostEntity()  
      //con esto reproducimos los videos de links y los convertimos en VideoPost
      //no se le olvide agregar el archivo local_video_post.dart en la carpeta shared/data
    
    ).toList(); //conversion de List<LocalVideoModel> a List<VideoPost>

    return newVideos;
  }
  
}