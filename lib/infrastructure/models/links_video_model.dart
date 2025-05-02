
import 'package:toktik_2_0/domain/entities/video_post.dart';

class LinkVideoModel{

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LinkVideoModel({
    required this.videoUrl,
    required this.likes,
    required this.views,
    required this.name 
  });

  
  factory LinkVideoModel.fromJson(Map<String, dynamic> json) => LinkVideoModel(
      videoUrl: json["videoUrl"], 
      likes: json["likes"] ?? 0, // if null, set to 0 
      views: json["views"] ?? 0,
      name: json["name"] ?? "No name"
  );

  VideoPost toVideoPostEntity() => VideoPost( //coversion de LocalVideoModel a VideoPost
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views
    
  );

}
