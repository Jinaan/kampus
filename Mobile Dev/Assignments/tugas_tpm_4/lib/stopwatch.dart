import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Timer _timer;
  String _stopwatchText = '00:00:00.00';
  bool _isRunning = false;
  Duration elapse = Duration.zero;

  @override
  void initState() {
    super.initState();
    _loadStopwatch(); // Load elapsed time from Hive
    _timer = Timer.periodic(Duration(milliseconds: 10), _updateStopwatch);
  }

  @override
  void dispose() {
    _timer.cancel();
    _saveStopwatch(); // Save elapsed time to Hive
    super.dispose();
  }

  Future<void> _loadStopwatch() async {
    final box = await Hive.openBox('stopwatchBox');
    int? savedMilliseconds = box.get('elapsedMilliseconds', defaultValue: 0);
    if (savedMilliseconds != null) {
      elapse = Duration(milliseconds: savedMilliseconds);
      _stopwatchText = _formatStopwatchTime(
          elapse.inMilliseconds); // Update text immediately
      setState(() {
        _isRunning = false; // Ensure stopwatch starts as not running
      });
    }
    await box.close();
  }

  Future<void> _saveStopwatch() async {
    final box = await Hive.openBox('stopwatchBox');
    if (!_isRunning) {
      await box.put('elapsedMilliseconds', elapse.inMilliseconds);
    }
    await box.close();
  }

  void _updateStopwatch(Timer timer) {
    if (_isRunning) {
      setState(() {
        elapse += Duration(milliseconds: 10);
        _stopwatchText = _formatStopwatchTime(elapse.inMilliseconds);
      });
    }
  }

  String _formatStopwatchTime(int milliseconds) {
    final int hundredths = (milliseconds % 1000 ~/ 10);
    final int seconds = (milliseconds ~/ 1000) % 60;
    final int minutes = (milliseconds ~/ (1000 * 60)) % 60;
    final int hours = (milliseconds ~/ (1000 * 60 * 60)) % 24;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String hundredthsStr = hundredths.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr.$hundredthsStr';
  }

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
    });
  }

  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
      _saveStopwatch(); // Save elapsed time when stopping
    });
  }

  void _resetStopwatch() {
    setState(() {
      _isRunning = false;
      elapse = Duration.zero;
      _stopwatchText = '00:00:00.00';
      _saveStopwatch(); // Save elapsed time when resetting
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _stopwatchText,
            style: TextStyle(fontSize: 48),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_isRunning) {
                    _stopStopwatch();
                  } else {
                    _startStopwatch();
                  }
                },
                child: _isRunning ? Text('Stop') : Text('Start'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _resetStopwatch,
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
