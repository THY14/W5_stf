import 'package:flutter/material.dart';

List<String> images = [
  "assets/assets/w4-s2/bird.jpg",
  "assets/assets/w4-s2/bird2.jpg",
  "assets/assets/w4-s2/insect.jpg",
  "assets/assets/w4-s2/girl.jpg",
  "assets/assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: true, // Why this line ? Can you explain it ?
    home: ImageViewerPage(),
  ),
);

class ImageViewerPage extends StatefulWidget {
  const ImageViewerPage({super.key});

  @override
  State<ImageViewerPage> createState() => ImageViewerPageState();
}

class ImageViewerPageState extends State<ImageViewerPage> {
  int currentIndex = 0;
  void nextButton() {
    setState(() {
      if (currentIndex == images.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
    });
  }

  void previousButton() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = images.length - 1;
      } else {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousButton,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextButton,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}