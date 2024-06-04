import 'package:flutter/material.dart';

class TimePickerDropdown extends StatefulWidget {
  final TimeOfDay initialTime;
  final void Function(TimeOfDay) onChanged;

  const TimePickerDropdown(
      {Key? key, required this.initialTime, required this.onChanged})
      : super(key: key);

  @override
  State<TimePickerDropdown> createState() => _TimePickerDropdownState();
}

class _TimePickerDropdownState extends State<TimePickerDropdown> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TimeOfDay>(
      value: _selectedTime,
      onChanged: (TimeOfDay? newValue) {
        setState(() {
          _selectedTime = newValue!;
        });
        widget.onChanged(newValue!);
      },
      items: _generateTimeItems(),
    );
  }

  List<DropdownMenuItem<TimeOfDay>> _generateTimeItems() {
    List<DropdownMenuItem<TimeOfDay>> items = [];
    for (int hour = 0; hour < 24; hour++) {
      for (int minute = 0; minute < 60; minute++) {
        TimeOfDay time = TimeOfDay(hour: hour, minute: minute);
        items.add(
          DropdownMenuItem<TimeOfDay>(
            value: time,
            child: Text('${time.format(context)}'),
          ),
        );
      }
    }
    return items;
  }
}

// TimePickerDropdown(
//   initialTime: TimeOfDay.now(),
//   onChanged: (TimeOfDay time) {
//     print('Selected time: ${time.format(context)}');
//   },
// ),
