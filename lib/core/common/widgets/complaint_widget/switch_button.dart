import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final ValueChanged<bool> onStatusChanged; // Add this line

  const SwitchButton(
      {super.key, required this.onStatusChanged}); // Modify the constructor

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _isOpen = false;

  void _toggleSwitch() {
    setState(() {
      _isOpen = !_isOpen;
    });
    widget.onStatusChanged(_isOpen); // Call the callback with the new status
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: Material(
        elevation: 3.0, // Adjust the elevation as needed
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _isOpen ? Colors.teal : Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    'Open',
                    style: TextStyle(
                      color: _isOpen ? Colors.white : Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: !_isOpen ? Colors.teal : Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: !_isOpen ? Colors.white : Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
