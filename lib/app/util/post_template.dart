import 'package:flutter/material.dart';
import 'package:modul3/app/modules/models/post_template_models.dart';
import 'button.dart';

class PostTemplate extends StatelessWidget {
  final Future<PostData> postDataFuture;
  final userPost;

  PostTemplate({
    required this.postDataFuture,
    required this.userPost,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostData>(
      future: postDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          PostData postData = snapshot.data!;

          return Scaffold(
            body: Stack(
              children: [
                userPost,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(postData.authorAvatar),
                            radius: 25,
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('@' + postData.author,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(postData.caption,
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(postData.hashtag,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment(1, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          icon: Icons.favorite,
                          number: postData.likes,
                        ),
                        MyButton(
                          icon: Icons.chat_bubble_outlined,
                          number: postData.comments,
                        ),
                        MyButton(
                          icon: Icons.send,
                          number: postData.shares,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
