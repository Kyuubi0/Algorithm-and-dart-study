// screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color _selectedColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _loadColor();
  }

  _loadColor() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedColor =
          Color(prefs.getInt('backgroundColor') ?? Colors.white.value);
    });
  }

  _saveColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('backgroundColor', color.value);
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Background color',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _colorButton(Colors.white),
                _colorButton(Colors.blue[100]!),
                _colorButton(Colors.green[100]!),
                _colorButton(Colors.pink[100]!),
                _colorButton(Colors.yellow[100]!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorButton(Color color) {
    return GestureDetector(
      onTap: () => _saveColor(color),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: _selectedColor == color ? Colors.blue : Colors.grey,
            width: _selectedColor == color ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
