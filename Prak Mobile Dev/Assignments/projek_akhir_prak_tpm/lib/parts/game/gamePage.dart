import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../API/game/conn.dart';
import '../../API/games/dataConn.dart';

class GamePage extends StatelessWidget {
  final int gameId;
  final jsonGames selectedGame;

  GamePage({required this.gameId, required this.selectedGame});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedGame.title!),
      ),
      body: FutureBuilder<JsonGameDetails>(
        future: _fetchGameDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildGameDetails(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<JsonGameDetails> _fetchGameDetails() async {
    return await GamesConn().getGameDetails(gameId);
  }

  Widget _buildGameDetails(JsonGameDetails gameDetails) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Center(
          child: Image.network(
            gameDetails.thumbnail!,
            height: 200,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          gameDetails.shortDescription!,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0),
        Text(
          'Description:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(gameDetails.description!),
        SizedBox(height: 16.0),
        _buildDetailTable(gameDetails),
        SizedBox(height: 16.0),
        Text(
          'Minimum System Requirements:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 8.0),
        if (gameDetails.minimumSystemRequirements == null ||
            gameDetails.minimumSystemRequirements!.toJson().isEmpty)
          Text('No information available')
        else
          _buildSysReqTable(gameDetails),
        SizedBox(height: 16.0),
        Text(
          'Screenshots:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 8.0),
        if (gameDetails.screenshots == null)
          Text('No screenshots available')
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: gameDetails.screenshots!
                  .map((screenshot) => Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Image.network(
                          screenshot.image!,
                          width: 300,
                        ),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildDetailTable(JsonGameDetails gameDetails) {
    return Table(
      columnWidths: {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      children: [
        _buildTableRow('Platform', gameDetails.platform!),
        _buildTableRow('Status', gameDetails.status!),
        _buildTableRow('Genre', gameDetails.genre!),
        _buildTableRow('Publisher', gameDetails.publisher!),
        _buildTableRow('Developer', gameDetails.developer!),
        _buildTableRow('Release Date', gameDetails.releaseDate!),
      ],
    );
  }

  Widget _buildSysReqTable(JsonGameDetails gameDetails) {
    return Table(
      columnWidths: {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      children: gameDetails.minimumSystemRequirements!
          .toJson()
          .entries
          .map((entry) => _buildTableRow(
              entry.key, entry.value == null ? 'Not specified' : entry.value!))
          .toList(),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            label + ' ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Text(value),
        ),
      ],
    );
  }
}
