import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class GameCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> genres;
  final List<String> images;
  final String longDescription;

  GameCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.genres,
    required this.images,
    required this.longDescription,
  });

  void _showGameDetailsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGenreList(),
                SizedBox(height: 10),
                _buildGameImages(context), // Pass context to _buildGameImages
                SizedBox(height: 10),
                Text(
                  longDescription,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGenreList() {
    return Wrap(
      spacing: 8,
      children: genres.map((genre) {
        return Chip(
          label: Text(genre),
        );
      }).toList(),
    );
  }

  Widget _buildGameImages(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: images.map((imageUrl) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: PhotoView(
                      imageProvider: NetworkImage(imageUrl),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      backgroundDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 150, // Fixed height for each image
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = 300.0;
    final cardHeight = 300.0;
    final cardSpacing = 16.0;

    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        margin: EdgeInsets.symmetric(horizontal: cardSpacing / 2),
        color: Theme.of(context).colorScheme.background,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Container(
                          width: double.infinity,
                          height: double.parse(400.toString()),
                          child: PhotoView(
                            imageProvider: NetworkImage(imageUrl),
                            minScale: PhotoViewComputedScale.contained,
                            maxScale: PhotoViewComputedScale.covered * 2,
                            backgroundDecoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height:
                        cardWidth * 170 / 300, // 60% of card height for image
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showGameDetailsPopup(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
