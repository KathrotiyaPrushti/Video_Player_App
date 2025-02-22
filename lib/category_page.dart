import 'package:flutter/material.dart';
import 'source_selection_page.dart'; // ✅ Import the missing file

class CategoryPage extends StatelessWidget {
  final Map<String, Map<String, String>> videoCategories = {
    "Flowers": {
      "local": "assets/videos/flower.mp4",
      "url": "https://youtu.be/kIRb60r3cH8?si=HFzQFBxXAOB50ddY",
    },
    "Tree": {
      "local": "assets/videos/tree.mp4",
      "url": "https://youtu.be/wY8DMF8nlw0?si=y9-6i5Wsbg7KMBek",
    },
    "Beauty": {
      "local": "assets/videos/beauty.mp4",
      "url": "https://www.youtube.com/shorts/l4ETb6zkh84?feature=share",
    },
    "Animal": {
      "local": "assets/videos/animal.mp4",
      "url": "https://youtu.be/bWzN8qamoDQ?si=fdzxmaeTCkkeoVZR",
    },
    "River": {
      "local": "assets/videos/river.mp4",
      "url": "https://youtu.be/crDWEskuPII?si=PwS9J_2wGRXLEz7Z",
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select a Video Category")),
      body: ListView(
        children: videoCategories.keys.map((category) {
          return Card(
            color: Colors.purple.shade100,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(category, style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SourceSelectionPage( // ✅ No more error
                      category: category,
                      videoPaths: videoCategories[category]!,
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
