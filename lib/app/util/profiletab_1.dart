import 'package:flutter/material.dart';
import 'package:modul3/app/modules/models/profile_tab1_models.dart';


class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imageUrls.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        String processedImageUrl = processImage(imageUrls[index]);
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            color: Colors.grey[200],
            child: Image.network(
              processedImageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
