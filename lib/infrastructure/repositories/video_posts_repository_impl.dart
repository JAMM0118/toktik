import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository{

  final VideoPostDataSource videosPostDataSource;

  VideoPostsRepositoryImpl({required this.videosPostDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendigVideosByPage(int page) {
    return videosPostDataSource.getTrendigVideosByPage(page);
    
  }

}