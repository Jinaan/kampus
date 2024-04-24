import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tesat1/theme/themeProvider.dart';
import 'package:tesat1/parts/swipeAction.dart';
import 'package:tesat1/parts/MenuOverlay.dart';
import 'package:tesat1/parts/GameCard.dart';
import 'package:tesat1/parts/list_helper.dart';
import 'package:tesat1/API/connectAPI.dart';
import 'package:tesat1/API/templateAPI.dart';
import 'package:tesat1/API/API.dart';
import 'package:http/http.dart' as http;

class SwipeContent extends StatefulWidget {
  SwipeContent({Key? key}) : super(key: key);

  @override
  _SwipeContentState createState() => _SwipeContentState();
}

class _SwipeContentState extends State<SwipeContent> {
  late Future<List<newCard>> _fetchNewCards;

  @override
  void initState() {
    super.initState();
    _fetchNewCards = getNewCard();
  }

  Future<List<newCard>> getNewCard() async {
    final response = await newCardAPI.getNewCard();
    Iterable list = json.decode(response.body);
    // for each list edit on list.images to add API_URL + "/image?imagePath=" + list.images
    print(list);
    for (var i = 0; i < list.length; i++) {
      // list.elementAt(i)['images'] = list
      //     .elementAt(i)['images']
      //     .map((image) => API_URL + "/image?imagePath=" + image)
      //     .toList();
      print(list.elementAt(i)['detailImageUrlList']);
      for (var j = 0; j < list.elementAt(i)['detailImageUrlList'].length; j++) {
        list.elementAt(i)['detailImageUrlList'][j] = API_URL +
            "/image?imagePath=" +
            list.elementAt(i)['detailImageUrlList'][j];
      }
    }
    print(list);
    return list.map((model) => newCard.fromJson(model)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<newCard>>(
      future: _fetchNewCards,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading data'));
        } else {
          List<newCard> newCardList = snapshot.data ?? [];
          return MenuOverlay(
            mainPage: ListView.builder(
              itemCount: newCardList.length,
              itemBuilder: (context, index) {
                final newCard item = newCardList[index];
                return SwipeCardWidget(
                  content: GameCard(
                    imageUrl: API_URL + "/image?imagePath=" + item.imageUrl,
                    title: item.title,
                    description: item.description,
                    genres: item.genres,
                    images: item.images,
                    longDescription: item.longDescription,
                  ),
                  onSwipeLeft: () async {
                    try {
                      await ListHelper.addToWasteList(item.title);
                    } catch (e) {
                      print(e);
                    }
                  },
                  onSwipeRight: () async {
                    try {
                      await ListHelper.addToWantList(item.title);
                    } catch (e) {
                      print(e);
                    }
                  },
                );
              },
            ),
            deletedPage: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Deleted Content'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Clear Deleted Content'),
                  ),
                ],
              ),
            ),
            savedPage: Center(
              child: Text('Saved Content'),
            ),
          );
        }
      },
    );
  }
}
