import 'package:flutter/material.dart';
import '../../API/games/dataConn.dart';

import '../game/gamePage.dart';

// class GamesWidget extends StatelessWidget {
//   final List<jsonGames> games;

//   GamesWidget({required this.games});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: games.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             leading: Image.network(games[index].thumbnail!),
//             title: Text(games[index].title!),
//             subtitle: Text(games[index].shortDescription!),
//             trailing: Text(games[index].platform!),
//           ),
//         );
//       },
//     );
//   }
// }

class GamesWidget extends StatelessWidget {
  final List<jsonGames> games;

  GamesWidget({required this.games});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: games.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GamePage(
                    gameId: games[index].id!, selectedGame: games[index]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // position of shadow
                ),
              ],
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.network(
                        games[index].thumbnail!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4.0),
                    child: Text(
                      games[index].title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4.0),
                    child: Text(
                      games[index].shortDescription!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: _buildPlatformIcons(games[index].platform!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildPlatformIcons(String platforms) {
    List<Widget> icons = [];

    if (platforms.contains("PC (Windows)") || platforms.contains("PC (MAC)")) {
      icons.add(Icon(Icons.computer, size: 20.0));
    }
    if (platforms.contains("mobile")) {
      icons.add(Icon(Icons.smartphone, size: 20.0));
    }
    if (platforms.contains("Web Browser")) {
      icons.add(Icon(Icons.web, size: 20.0));
    }

    return icons;
  }
}
