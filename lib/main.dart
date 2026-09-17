import 'package:flutter/material.dart';

void main() {
  runApp(const ArtSpaceApp());
}

class Artwork {
  final String image;
  final String title;
  final String artist;
  final String year;

  const Artwork({
    required this.image,
    required this.title,
    required this.artist,
    required this.year,
  });
}

class ArtSpaceApp extends StatelessWidget {
  const ArtSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Art Space',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff5069a5),
        ),
      ),
      home: const ArtSpacePage(),
    );
  }
}

class ArtSpacePage extends StatefulWidget {
  const ArtSpacePage({super.key});

  @override
  State<ArtSpacePage> createState() => _ArtSpacePageState();
}

class _ArtSpacePageState extends State<ArtSpacePage> {
  int currentArtwork = 0;

  final artworks = const [
    Artwork(
      image: 'assets/images/aerith.jpg',
      title: 'Beautiful Flower Girl',
      artist: 'Tetsuya Nomura',
      year: '2020',
    ),
    Artwork(
      image: 'assets/images/aerithatbeach.jpg',
      title: 'Flower Girl at the Beach',
      artist: 'Tetsuya Nomura',
      year: '2022',
    ),
  ];

  void showPreviousArtwork() {
    setState(() {
      currentArtwork =
          (currentArtwork - 1 + artworks.length) % artworks.length;
    });
  }

  void showNextArtwork() {
    setState(() {
      currentArtwork = (currentArtwork + 1) % artworks.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final artwork = artworks[currentArtwork];

    return Scaffold(
      backgroundColor: const Color(0xfffaf8fc),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  // Artwork wall
                  Semantics(
                    label: 'Artwork: ${artwork.title}',
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 0.75,
                        child: Image.asset(
                          artwork.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Artwork descriptor
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    color: const Color(0xffeeedf5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          artwork.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${artwork.artist} (${artwork.year})',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Display controller
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: showPreviousArtwork,
                          child: const Text('Previous'),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: showNextArtwork,
                          child: const Text('Next'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}