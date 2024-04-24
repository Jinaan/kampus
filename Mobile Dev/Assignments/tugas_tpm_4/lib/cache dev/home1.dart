import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesat1/theme/themeProvider.dart';
import 'package:tesat1/parts/swipeAction.dart';
import 'package:tesat1/parts/MenuOverlay.dart';
import 'package:tesat1/parts/GameCard.dart';

// class HomePage extends StatelessWidget {
// // Define breakpoints for different screen widths
// static const int smallScreenWidth = 720;
// static const int largeScreenWidth = 1080;

// // Define the number of widgets per row at different screen widths
// int calculateWidgetsPerRow(double screenWidth) {
//   if (screenWidth < smallScreenWidth) {
//     return 1; // Display 1 widget per row for screens < 720px wide
//   } else if (screenWidth < largeScreenWidth) {
//     return 3; // Display 3 widgets per row for screens >= 720px and < 1080px wide
//   } else {
//     return 5; // Display 5 widgets per row for screens >= 1080px wide
//   }
// }

// const HomePage({Key? key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Home Page', style: TextStyle(color: Colors.white)),
//       actions: [
//         IconButton(
//           onPressed: () {
//             Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
//           },
//           icon: const Icon(Icons.sunny),
//         ),
//       ],
//       backgroundColor: Theme.of(context).colorScheme.primary,
//     ),
//     body: LayoutBuilder(
//       builder: (context, constraints) {
//         // Get current screen width
//         double screenWidth = constraints.maxWidth;

//         // Calculate number of widgets to display per row
//         int widgetsPerRow = calculateWidgetsPerRow(screenWidth);

//         // Generate list of widgets
//         List<Widget> widgets = List.generate(
//           15, // Total number of widgets you want to display
//           (index) => Container(
//             color: Colors.blue,
//             height: 100,
//             width: double.infinity,
//             margin: EdgeInsets.all(8),
//             child: Center(
//               child: Text(
//                 'Widget ${index + 1}',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//           ),
//         );

//         // Use Wrap or GridView to layout widgets dynamically
//         return GridView.count(
//           crossAxisCount: widgetsPerRow,
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//           children: widgets,
//         );
//       },
//     ),
//   );
// }

// }

class HomePage extends StatefulWidget {
  @override
  _TabbedAppState createState() => _TabbedAppState();
}

class _TabbedAppState extends State<HomePage>
    with SingleTickerProviderStateMixin {
//   List<String> _tabs = ['Tab 1', 'Tab 2', 'Tab 3']; // Initial tabs
//   int _tabCount = 3; // Initial number of tabs

//   void _addTab() {
//     setState(() {
//       _tabCount++; // Increment tab count
//       _tabs.add('Tab $_tabCount'); // Add new tab to the list
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: _tabCount,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Dynamic Tabs App'),
//           bottom: TabBar(
//             tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
//           ),
//         ),
//         body: TabBarView(
//           children:
//               _tabs.map((tab) => Center(child: Text('$tab Content'))).toList(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _addTab,
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

  // List<String> _tabs = ['Tab 1', 'Tab 2', 'Tab 3']; // Initial tabs
  // int _tabCount = 3; // Initial number of tabs

  // void _addTab() {
  //   if (!mounted) return; // Check if the widget is still mounted

  //   setState(() {
  //     _tabCount++; // Increment tab count
  //     _tabs.add('Tab $_tabCount'); // Add new tab to the list
  //   });
  // }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: _tabCount,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.grey[200], // Background color of app bar
//           title: Text(
//             'Chrome-like Tabs',
//             style: TextStyle(color: Colors.black),
//           ),
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(48.0),
//             child: Container(
//               color: Colors.white, // Background color of tab bar
//               child: TabBar(
//                 labelColor: Colors.blue, // Color of selected tab label
//                 unselectedLabelColor:
//                     Colors.black, // Color of unselected tab label
//                 indicator: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Colors.blue,
//                       width: 2.0,
//                     ),
//                   ),
//                 ),
//                 tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
//               ),
//             ),
//           ),
//         ),
//         body: Container(
//           color: Colors.grey[200], // Background color of tab view area
//           child: TabBarView(
//             children: _tabs
//                 .map((tab) => Center(child: Text('$tab Content')))
//                 .toList(),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _addTab,
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

//   int _number = 0;
//   String _result = "";

//   String _checkNumber() {
//     if (_number % 2 == 0) {
//       return "Genap";
//     } else {
//       return "Ganjil";
//     }
//   }

//   List<String> _tabs = ['Tab 1', 'Tab 2', 'Tab 3']; // Initial tabs
//   int _tabCount = 3; // Initial number of tabs

//   void _addTab() {
//     if (!mounted) return; // Check if the widget is still mounted

//     setState(() {
//       _tabCount++; // Increment tab count
//       _tabs.add('Tab $_tabCount'); // Add new tab to the list
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: _tabCount,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.grey[200], // Background color of app bar
//           title: Text(
//             'Chrome-like Tabs',
//             style: TextStyle(color: Colors.black),
//           ),
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(48.0),
//             child: Container(
//               color: Colors.white, // Background color of tab bar
//               child: TabBar(
//                 labelColor: Colors.blue, // Color of selected tab label
//                 unselectedLabelColor:
//                     Colors.black, // Color of unselected tab label
//                 indicator: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Colors.blue,
//                       width: 2.0,
//                     ),
//                   ),
//                 ),
//                 tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
//               ),
//             ),
//           ),
//         ),
//         body: Container(
//           color: Colors.grey[200], // Background color of tab view area
//           child: TabBarView(
//             children: _tabs
//                 .map((tab) => Center(
//                       child: _TabContent(
//                         tabContentState: _TabContentState(),
//                         key: Key(tab),
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _addTab,
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }

//   Widget _middleContainer() {
//     return Column(
//       children: [
//         Text(
//           '$_number itu $_result',
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//         const Padding(padding: EdgeInsets.only(top: 20)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.8,
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Angka',
//                   hintText: 'Masukkan angka disini',
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     try {
//                       _number = int.parse(value);
//                     } catch (e) {
//                       _number = 0;
//                       // if string, show snackbar
//                       if (value.isNotEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Input harus angka'),
//                             duration: Duration(seconds: 1),
//                           ),
//                         );
//                       }
//                     }
//                     _result = _checkNumber();
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

//   List<String> _tabs = ['Tab 1', 'Tab 2', 'Tab 3']; // Initial tabs
//   int _tabCount = 3; // Initial number of tabs
//   late TabController _tabController;

//   // Map to store state (number and result) for each tab index
//   Map<int, _TabContentState> _tabContentStates = {};

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: _tabCount, vsync: this);
//   }

//   void _addTab() {
//     if (!mounted) return; // Check if the widget is still mounted

//     setState(() {
//       _tabCount++; // Increment tab count
//       _tabs.add('Tab $_tabCount'); // Add new tab to the list
//       _tabController = TabController(length: _tabCount, vsync: this);
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose(); // Dispose of the TabController
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: _tabCount,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.grey[200], // Background color of app bar
//           title: Text(
//             'Chrome-like Tabs',
//             style: TextStyle(color: Colors.black),
//           ),
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(48.0),
//             child: Container(
//               color: Colors.white, // Background color of tab bar
//               child: TabBar(
//                 controller: _tabController,
//                 labelColor: Colors.blue, // Color of selected tab label
//                 unselectedLabelColor:
//                     Colors.black, // Color of unselected tab label
//                 indicator: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Colors.blue,
//                       width: 2.0,
//                     ),
//                   ),
//                 ),
//                 tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
//               ),
//             ),
//           ),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: _tabs.map((tab) {
//             // Get or create _TabContentState for each tab index
//             final tabIndex = _tabs.indexOf(tab);
//             if (!_tabContentStates.containsKey(tabIndex)) {
//               _tabContentStates[tabIndex] = _TabContentState();
//             }
//             return _TabContent(
//               key: Key(tab),
//               tabContentState: _tabContentStates[tabIndex]!,
//             );
//           }).toList(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _addTab,
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

// class _TabContent extends StatefulWidget {
//   final _TabContentState tabContentState;

//   _TabContent({required Key key, required this.tabContentState})
//       : super(key: key);

//   @override
//   _TabContentState createState() => tabContentState;
// }

// class _TabContentState extends State<_TabContent> {
//   int _number = 0;
//   late String _result;

//   @override
//   void initState() {
//     super.initState();
//     _result = _checkNumber();
//   }

//   String _checkNumber() {
//     return _number % 2 == 0 ? "Genap" : "Ganjil";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           '$_number itu $_result',
//           style: Theme.of(context).textTheme.headline6,
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.8,
//           child: TextField(
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Angka',
//               hintText: 'Masukkan angka di sini',
//             ),
//             onChanged: (value) {
//               setState(() {
//                 try {
//                   _number = int.parse(value);
//                 } catch (e) {
//                   _number = 0;
//                   if (value.isNotEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Input harus angka'),
//                         duration: Duration(seconds: 1),
//                       ),
//                     );
//                   }
//                 }
//                 _result = _checkNumber();
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

  List<String> wantList = [];
  List<String> wasteList = [];

  void addToWantList(String item) {
    setState(() {
      wantList.add(item);
    });
  }

  void addToWasteList(String item) {
    setState(() {
      wasteList.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Actions Example'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(Icons.sunny),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MenuOverlay(
            mainPage: ListView(
              children: [
                SwipeCardWidget(
                  content: GameCard(
                    imageUrl: 'https://via.placeholder.com/300',
                    title: 'Item 1',
                    description: 'Swipe left to waste, right to want',
                  ),
                  onSwipeLeft: () {
                    addToWasteList('Item 1');
                  },
                  onSwipeRight: () {
                    addToWantList('Item 1');
                  },
                ),
                SwipeCardWidget(
                  content: GameCard(
                    imageUrl: 'https://via.placeholder.com/300',
                    title: 'Item 1',
                    description: 'Swipe left to waste, right to want',
                  ),
                  onSwipeLeft: () {
                    addToWasteList('Item 2');
                  },
                  onSwipeRight: () {
                    addToWantList('Item 2');
                  },
                ),
                // Add more SwipeCardWidgets as needed
              ],
            ),
            deletedPage: Container(
              child: Column(
                children: [
                  GameCard(
                    imageUrl: 'https://via.placeholder.com/300',
                    title: 'Deleted Content',
                    description: 'Content that was swiped left',
                  ),
                  GameCard(
                    imageUrl: 'https://via.placeholder.com/300',
                    title: 'Deleted Content',
                    description: 'Content that was swiped left',
                  ),
                  SwipeCardWidget(
                    content: GameCard(
                      imageUrl: 'https://via.placeholder.com/300',
                      title: 'Item 1',
                      description: 'Swipe left to waste, right to want',
                    ),
                    onSwipeLeft: () {
                      addToWasteList('Item 2');
                    },
                    onSwipeRight: () {
                      addToWantList('Item 2');
                    },
                  ),
                ],
              ),
            ),
            savedPage: Center(
              child: Text('Saved Content'),
            ),
          ),
        ),
      ),
      // ListView(
      //   children: [
      //     SwipeCardWidget(
      //       title: 'Item 1',
      //       onSwipeLeft: () {
      //         addToWasteList('Item 1');
      //       },
      //       onSwipeRight: () {
      //         addToWantList('Item 1');
      //       },
      //     ),
      //     SwipeCardWidget(
      //       title: 'Item 2',
      //       onSwipeLeft: () {
      //         addToWasteList('Item 2');
      //       },
      //       onSwipeRight: () {
      //         addToWantList('Item 2');
      //       },
      //     ),
      //     // Add more SwipeCardWidgets as needed
      //   ],
      // ),
    );
  }
}
