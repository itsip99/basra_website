import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/models/Report/free_stock_result.dart';
import 'package:stsj/core/providers/Provider.dart';

class NumberInputField extends StatefulWidget {
  final String initialValue;
  final int minValue;
  final int maxValue;
  final int index;

  const NumberInputField({
    super.key,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.index,
  });

  @override
  State<NumberInputField> createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  late int _currentValue;
  late int _dbValue;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _currentValue = int.tryParse(widget.initialValue)!;
    _dbValue = int.tryParse(widget.initialValue)!;
    _controller = TextEditingController(text: widget.initialValue.toString());
  }

  void _increment(MenuState state) {
    if (_currentValue < widget.maxValue) {
      setState(() {
        _currentValue++;
        _controller.text = _currentValue.toString();
        (state.freeStockResult['data'][widget.index] as FreeStockResultModel)
            .adjustStock = _currentValue;
      });

      if (_currentValue != _dbValue) {
        state.setIsValueChanged(true);
      } else {
        state.setIsValueChanged(false);
      }
    }
  }

  void _decrement(MenuState state) {
    if (_currentValue > widget.minValue) {
      setState(() {
        _currentValue--;
        _controller.text = _currentValue.toString();
        (state.freeStockResult['data'][widget.index] as FreeStockResultModel)
            .adjustStock = _currentValue;
      });

      if (_currentValue != _dbValue) {
        state.setIsValueChanged(true);
      } else {
        state.setIsValueChanged(false);
      }
    }
  }

  void _onTextChanged(String text, MenuState state) {
    final newValue = int.tryParse(text);
    if (newValue != null &&
        newValue >= widget.minValue &&
        newValue <= widget.maxValue) {
      setState(() {
        _currentValue = newValue;
        _controller.text = _currentValue.toString();
        (state.freeStockResult['data'][widget.index] as FreeStockResultModel)
            .adjustStock = _currentValue;
      });

      if (_currentValue != _dbValue) {
        state.setIsValueChanged(true);
      } else {
        state.setIsValueChanged(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MenuState>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Decrement Button
        InkWell(
          onTap: () => _decrement(state),
          child: Icon(Icons.remove),
        ),

        // Divider
        SizedBox(width: 10),

        // TextField
        SizedBox(
          width: 80,
          child: TextField(
            controller: TextEditingController(text: _currentValue.toString()),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (text) => _onTextChanged(text, state),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ),

        // Divider
        SizedBox(width: 10),

        // Increment Button
        InkWell(
          onTap: () => _increment(state),
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
