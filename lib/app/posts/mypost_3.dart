import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3/app/modules/home/controllers/YourController.dart';
import 'package:modul3/app/modules/home/views/myWebView.dart';
import 'package:modul3/app/util/post_template.dart';
// Impor model PostData

class MyPost3 extends StatelessWidget {
  final YourController controller = Get.put(YourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.postData.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          var postData = controller.postData[2];

          return PostTemplate(
            postDataFuture: Future.value(postData),
            userPost: Container(
              color: Colors.green[300],
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    MyWebView(url: postData.videoUrl),
                  ); // Menggunakan Ge,t.to untuk membuka MyWebView
                },
              ),
            ),
          );
        }
      }),
    );
  }
}
