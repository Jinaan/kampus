import 'package:flutter/material.dart';
import 'package:tesat1/theme/theme.dart';

class MenuOverlay extends StatefulWidget {
  final Widget mainPage;
  final Widget deletedPage;
  final Widget savedPage;

  MenuOverlay({
    required this.mainPage,
    required this.deletedPage,
    required this.savedPage,
  });

  @override
  _MenuOverlayState createState() => _MenuOverlayState();
}

class _MenuOverlayState extends State<MenuOverlay> {
  late Widget _currentPage;
  bool _isMenuVisible = false;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.mainPage; // Set initial page content to mainPage
  }

  void _toggleMenuVisibility() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  void _showMainPage() {
    _setPage(widget.mainPage);
  }

  void _showDeletedPage() {
    _setPage(widget.deletedPage);
  }

  void _showSavedPage() {
    _setPage(widget.savedPage);
  }

  void _setPage(Widget page) {
    setState(() {
      _currentPage = page;
      _isMenuVisible = false; // Close the menu
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final menuWidth =
        screenWidth * 0.5; // Set the width of the menu options container

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _toggleMenuVisibility(); // Toggle menu visibility
          },
        ),
      ),
      body: Stack(
        children: [
          // Main content and menu
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (_isMenuVisible) {
                  // Close menu if it's visible and tapped outside the menu
                  _toggleMenuVisibility();
                }
              },
              child:
                  _currentPage, // Display the current page content (main, deleted, saved)
            ),
          ),
          // Menu container
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            right: _isMenuVisible ? screenWidth - menuWidth : screenWidth,
            child: Container(
              width: menuWidth,
              color: Theme.of(context).colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  _buildMenuButton(
                    text: 'Main Page',
                    onTap: _showMainPage,
                  ),
                  _buildMenuButton(
                    text: 'Deleted Page',
                    onTap: _showDeletedPage,
                  ),
                  _buildMenuButton(
                    text: 'Saved Page',
                    onTap: _showSavedPage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
