// ignore_for_file: file_names

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:modul3/app/modules/models/post_template_models.dart';

class YourController extends GetxController {
  var postData = <PostData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response = await http.get(
          Uri.parse("https://6540580245bedb25bfc1ccd1.mockapi.io/tiktok-api"));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        List<PostData> postDataList =
            (jsonData as List).map((item) => PostData.fromJson(item)).toList();

        postData.assignAll(postDataList);
      } else {
        throw Exception("Request Failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
