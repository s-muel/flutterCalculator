import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  double _result = 0.0;
  String _operator = '';

  void _onDigitPress(String digit) {
    setState(() {
      _input += digit;
    });
  }

  void _onOperatorPress(String operator) {
    setState(() {
      if (_input.isNotEmpty) {
        _result = double.parse(_input);
        _input = '';
      }

      _operator = operator;
    });
  }

  void _onClearPress() {
    setState(() {
      _input = '';
      _result = 0.0;
      _operator = '';
    });
  }

  void _onEqualsPress() {
    setState(() {
      if (_input.isNotEmpty) {
        double secondOperand = double.parse(_input);
        switch (_operator) {
          case '+':
            _result += secondOperand;
            break;
          case '-':
            _result -= secondOperand;
            break;
          case '*':
            _result *= secondOperand;
            break;
          case '/':
            _result /= secondOperand;
            break;
        }
        _input = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _input.isNotEmpty ? _input : _result.toString(),
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildOperatorButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildOperatorButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildOperatorButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0'),
              _buildButton('.'),
              _buildOperatorButton('+'),
              _buildClearButton(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('00'),
              _buildButton('000'),
              _buildEqualsButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
      onPressed: () => _onDigitPress(text),
    );
  }

  Widget _buildOperatorButton(String text) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
      onPressed: ()
  => _onOperatorPress(text),
);
}

Widget _buildClearButton() {
return ElevatedButton(
child: Text(
'C',
style: TextStyle(fontSize: 24.0),
),
onPressed: _onClearPress,
);
}

Widget _buildEqualsButton() {
return ElevatedButton(
child: Text(
'=',
style: TextStyle(fontSize: 24.0),
),
onPressed: _onEqualsPress,
);
}
}