import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  int _selectedThemeIndex = 0;

  List<String> _themes = ['Light', 'Dark', 'System Default'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Theme'),
            subtitle: Text(_themes[_selectedThemeIndex]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Select a theme'),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        _themes.length,
                        (index) => RadioListTile(
                          title: Text(_themes[index]),
                          value: index,
                          groupValue: _selectedThemeIndex,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedThemeIndex = value ?? 0;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('About'),
            onTap: () {
              // Navigate to About page
            },
          ),
        ],
      ),
    );
  }
}
