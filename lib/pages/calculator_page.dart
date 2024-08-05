import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _displayText = "";
  double _result = 0.0;
  String _operator = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  
  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _displayText = "";
        _result = 0.0;
        _operator = "";
        _num1 = 0.0;
        _num2 = 0.0;
      } else if (buttonText == "=") {
        _num2 = double.tryParse(_displayText) ?? 0.0;
        if (_operator == "+") {
          _result = _num1 + _num2;
        } else if (_operator == "-") {
          _result = _num1 - _num2;
        } else if (_operator == "*") {
          _result = _num1 * _num2;
        } else if (_operator == "/") {
          _result = _num1 / _num2;
        }
        _displayText = _result.toString();
        _operator = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _num1 = double.tryParse(_displayText) ?? 0.0;
        _operator = buttonText;
        _displayText = "";
      } else {
        _displayText += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  _displayText,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              shrinkWrap: true,
              itemCount: 16,
              itemBuilder: (context, index) {
                final buttons = [
                  "7", "8", "9", "/",
                  "4", "5", "6", "*",
                  "1", "2", "3", "-",
                  "C", "0", "=", "+",
                ];
                return ElevatedButton(
                  onPressed: () => _onButtonPressed(buttons[index]),
                  child: Text(
                    buttons[index],
                    style: TextStyle(fontSize: 24),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
