import 'package:flutter/material.dart';
import 'package:news_homework/theme/provider.dart';
import 'package:provider/provider.dart';

const List<Widget> themes = [
  Text('Light'),
  Text('Dark'),
];

class ToggleButtonsSample extends StatefulWidget {
  const ToggleButtonsSample({super.key});

  @override
  State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
  late bool _selectedTheme;

  @override
  void initState() {
    super.initState();
    _selectedTheme = Provider.of<ThemeProvider>(context, listen: false).isLight;
  }

  void changeTheme() {
    if (_selectedTheme) {
      Provider.of<ThemeProvider>(context, listen: false).turnOnDark();
    } else {
      Provider.of<ThemeProvider>(context, listen: false).turnOnLight();
    }
    setState(() {
      _selectedTheme = !_selectedTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: changeTheme,
      icon: _selectedTheme
          ? const Icon(Icons.sunny)
          : const Icon(Icons.nightlight_round),
    );
  }
}
