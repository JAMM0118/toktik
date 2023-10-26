
import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostRepository{

  Future<List<VideoPost>> getTrendigVideosByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByUser(int page);
}