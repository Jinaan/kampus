import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'API/API.dart';

class DetailCardPage extends StatefulWidget {
  final String cardId;

  DetailCardPage({required this.cardId});

  @override
  _DetailCardPageState createState() => _DetailCardPageState();
}

class _DetailCardPageState extends State<DetailCardPage> {
  late Future<Map<String, dynamic>> _cardDetails;

  @override
  void initState() {
    super.initState();
    _cardDetails = _fetchCardDetails();
  }

  Future<Map<String, dynamic>> _fetchCardDetails() async {
    final response =
        await http.get(Uri.parse('$API_LINK/cards/${widget.cardId}'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load card details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Details'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _cardDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final cardDetails = snapshot.data!;
              var cardImageUrl = cardDetails['image'];
              if (cardImageUrl == null) {
                cardImageUrl = 'https://via.placeholder.com/150';
              } else {
                cardImageUrl = cardImageUrl + "/high.png";
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ID: ${cardDetails['id']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Rarity: ${cardDetails['rarity']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Image.network(
                      cardImageUrl,
                      width: 300,
                      height: 400,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cardDetails['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('HP: ${cardDetails['hp']}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('illustrator: ${cardDetails['illustrator']}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Attacks:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (cardDetails['attacks'] as List<dynamic>)
                          .map<Widget>((attack) => Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ${attack['name']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                          'Cost: ${attack['cost'].join(', ')}'),
                                    ),
                                    SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child:
                                          Text('Effect: ${attack['effect']}'),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
