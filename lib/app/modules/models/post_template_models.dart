import 'dart:convert';

class PostData {
  final int videoId;
  final String videoUrl;
  final String caption;
  final String author;
  final String likes;
  final String comments;
  final String shares;
  final String authorAvatar;
  final String hashtag;

  PostData({
    required this.videoId,
    required this.videoUrl,
    required this.caption,
    required this.author,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.authorAvatar,
    required this.hashtag,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      videoId: json['videoId'],
      videoUrl: json['videoUrl'],
      caption: json['caption'],
      author: json['author'],
      likes: json['likes'],
      comments: json['comments'],
      shares: json['shares'],
      authorAvatar: json['authorAvatar'],
      hashtag: json['hashtag'],
    );
  }

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "videoUrl": videoUrl,
        "caption": caption,
        "author": author,
        "likes": likes,
        "comments": comments,
        "shares": shares,
        "authorAvatar": authorAvatar,
        "hashtag": hashtag,
      };
}

PostData todoFromJson(String str) => PostData.fromJson(json.decode(str));
String todoToJson(PostData data) => json.encode(data.toJson());
