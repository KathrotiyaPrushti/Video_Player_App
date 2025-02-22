import 'package:flutter/material.dart';
import 'video_page.dart';

class SourceSelectionPage extends StatelessWidget {
  final String category;
  final Map<String, String> videoPaths;

  SourceSelectionPage({required this.category, required this.videoPaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose Video Source")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPage(
                      category: category,
                      videoPath: videoPaths["local"]!,
                      isYouTube: false,
                    ),
                  ),
                );
              },
              child: Text("Play Local Video"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPage(
                      category: category,
                      videoPath: videoPaths["url"]!,
                      isYouTube: videoPaths["url"]!.contains("youtube.com") || videoPaths["url"]!.contains("youtu.be"),
                    ),
                  ),
                );
              },
              child: Text("Play Online Video"),
            ),
          ],
        ),
      ),
    );
  }
}
