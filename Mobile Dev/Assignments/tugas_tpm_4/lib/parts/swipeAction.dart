import 'package:flutter/material.dart';
import 'package:tesat1/theme/theme.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class SwipeCardWidget extends StatelessWidget {
  final Widget content;
  final Function? onSwipeLeft; // Function to handle left swipe
  final Function? onSwipeRight; // Function to handle right swipe

  SwipeCardWidget({
    required this.content,
    this.onSwipeLeft,
    this.onSwipeRight,
  });

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: UniqueKey(), // Use a unique key for each card
      backgroundColor: Theme.of(context).colorScheme.background,
      child: content, // Display the provided widget as the content of the card
      trailingActions: <SwipeAction>[
        SwipeAction(
          onTap: (CompletionHandler handler) async {
            if (onSwipeRight != null) {
              onSwipeRight!(); // Trigger right swipe action
            }
            handler(true); // Close swipe action after completion
          },
          color: Colors.green,
          icon: Icon(Icons.thumb_up),
        ),
      ],
      leadingActions: <SwipeAction>[
        SwipeAction(
          onTap: (CompletionHandler handler) async {
            if (onSwipeLeft != null) {
              onSwipeLeft!(); // Trigger left swipe action
            }
            handler(true); // Close swipe action after completion
          },
          color: Colors.red,
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}
