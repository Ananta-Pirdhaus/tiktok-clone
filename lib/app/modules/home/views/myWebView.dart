import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  final String url;

  MyWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Tambahkan aksi untuk like di sini
              },
            ),
            IconButton(
              icon: Icon(Icons.comment),
              onPressed: () {
                // Tambahkan aksi untuk comment di sini
              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // Tambahkan aksi untuk share di sini
              },
            ),
          ],
        ),
      ),
    );
  }
}
