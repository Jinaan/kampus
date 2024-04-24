import 'package:flutter/material.dart';

class EvenOddCheckerWidget extends StatefulWidget {
  @override
  _EvenOddCheckerWidgetState createState() => _EvenOddCheckerWidgetState();
}

class _EvenOddCheckerWidgetState extends State<EvenOddCheckerWidget> {
  late TextEditingController _controller;
  String _inputValue = '';
  String _resultText = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkEvenOdd() {
    setState(() {
      _inputValue = _controller.text.trim();
      if (_inputValue.isEmpty) {
        _resultText = 'Please enter a number.';
      } else if (_inputValue.length > 19) {
        _resultText = 'Number must be up to 19 digits long.';
      } else if (!_isNumeric(_inputValue)) {
        _resultText = 'Invalid input. Only digits and "-" allowed.';
      } else {
        int number = int.tryParse(_inputValue.replaceAll('-', '')) ?? 0;
        _resultText = (number % 2 == 0) ? 'Even' : 'Odd';
      }
    });
  }

  bool _isNumeric(String value) {
    return RegExp(r'^[0-9\-]+$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.numberWithOptions(
              signed: true,
              decimal: false,
            ),
            maxLength: 19,
            decoration: InputDecoration(
              labelText: 'Enter a number (up to 19 digits)',
              hintText: 'e.g., 1234567890',
              counterText: '',
            ),
            onChanged: (value) {
              setState(() {
                _resultText = ''; // Clear result when input changes
              });
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _checkEvenOdd,
            child: Text('Check Even/Odd'),
          ),
          SizedBox(height: 16.0),
          Text(
            _resultText,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
