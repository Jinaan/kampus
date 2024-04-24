import 'package:flutter/material.dart';
import 'dart:math';

enum TriangleType {
  rightTriangle,
  equilateralTriangle,
}

enum KnownInfo {
  sidesOnly,
  baseAndHeight,
}

class TriangleCalculatorWidget extends StatefulWidget {
  @override
  _TriangleCalculatorWidgetState createState() =>
      _TriangleCalculatorWidgetState();
}

class _TriangleCalculatorWidgetState extends State<TriangleCalculatorWidget> {
  late TextEditingController _sideAController;
  late TextEditingController _sideBController;
  late TextEditingController _sideCController;
  late TextEditingController _baseController;
  late TextEditingController _heightController;

  TriangleType _selectedTriangleType = TriangleType.rightTriangle;
  KnownInfo _selectedInfo = KnownInfo.sidesOnly;

  String _perimeterResult = '';
  String _areaResult = '';

  @override
  void initState() {
    super.initState();
    _sideAController = TextEditingController();
    _sideBController = TextEditingController();
    _sideCController = TextEditingController();
    _baseController = TextEditingController();
    _heightController = TextEditingController();
  }

  @override
  void dispose() {
    _sideAController.dispose();
    _sideBController.dispose();
    _sideCController.dispose();
    _baseController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_selectedInfo == KnownInfo.sidesOnly) {
      double sideA = double.parse(_sideAController.text.trim());

      if (_selectedTriangleType == TriangleType.rightTriangle) {
        double sideB = double.parse(_sideBController.text.trim());
        double sideC = double.parse(_sideCController.text.trim());
        // find side with 1st and 2nd lowest values
        List<double> sides = [sideA, sideB, sideC];
        sides.sort();
        double base = sides[0];
        double height = sides[1];

        double perimeter = sideA + sideB + sideC;
        double area = (base * height) / 2;

        setState(() {
          _perimeterResult = 'Perimeter: $perimeter';
          _areaResult = 'Area: $area';
        });
      } else if (_selectedTriangleType == TriangleType.equilateralTriangle) {
        double perimeter = 3 * sideA;
        double area = (sqrt(3) / 4) * pow(sideA, 2);

        setState(() {
          _perimeterResult = 'Perimeter: $perimeter';
          _areaResult = 'Area: $area';
        });
      }
    } else if (_selectedInfo == KnownInfo.baseAndHeight) {
      double base = double.parse(_baseController.text.trim());
      double height = double.parse(_heightController.text.trim());

      if (_selectedTriangleType == TriangleType.rightTriangle) {
        double sideC = sqrt(pow(base, 2) + pow(height, 2));
        double perimeter = base + height + sideC;
        double area = (base * height) / 2;

        setState(() {
          _perimeterResult = 'Perimeter: $perimeter';
          _areaResult = 'Area: $area';
        });
      } else if (_selectedTriangleType == TriangleType.equilateralTriangle) {
        double sideA = base;
        double perimeter = 3 * sideA;
        double area = (1 / 2) * height * base;

        setState(() {
          _perimeterResult = 'Perimeter: $perimeter';
          _areaResult = 'Area: $area';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton<TriangleType>(
            value: _selectedTriangleType,
            onChanged: (value) {
              setState(() {
                _selectedTriangleType = value!;
              });
            },
            items: [
              DropdownMenuItem(
                value: TriangleType.rightTriangle,
                child: Text('Right Triangle'),
              ),
              DropdownMenuItem(
                value: TriangleType.equilateralTriangle,
                child: Text('Equilateral Triangle'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          DropdownButton<KnownInfo>(
            value: _selectedInfo,
            onChanged: (value) {
              setState(() {
                _selectedInfo = value!;
              });
            },
            items: [
              DropdownMenuItem(
                value: KnownInfo.sidesOnly,
                child: Text('Known sides only'),
              ),
              DropdownMenuItem(
                value: KnownInfo.baseAndHeight,
                child: Text('Known base and height'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          if (_selectedInfo == KnownInfo.sidesOnly &&
              _selectedTriangleType == TriangleType.equilateralTriangle)
            TextField(
              controller: _sideAController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Side (All)'),
            ),
          if (_selectedInfo == KnownInfo.sidesOnly &&
              _selectedTriangleType != TriangleType.equilateralTriangle)
            Column(
              children: [
                TextField(
                  controller: _sideAController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Side A'),
                ),
                TextField(
                  controller: _sideBController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Side B'),
                ),
                TextField(
                  controller: _sideCController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Side C'),
                ),
              ],
            ),
          if (_selectedInfo == KnownInfo.baseAndHeight)
            Column(
              children: [
                TextField(
                  controller: _baseController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Base'),
                ),
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Height'),
                ),
              ],
            ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _calculate,
            child: Text('Calculate'),
          ),
          SizedBox(height: 16.0),
          Text(
            _perimeterResult,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            _areaResult,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
