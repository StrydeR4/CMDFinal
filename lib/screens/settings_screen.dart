
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  bool notifications = true;

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [

        const Text(
          'Settings',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        SwitchListTile(
          value: notifications,
          onChanged: (value) {
            setState(() {
              notifications = value;
            });
          },
          title: const Text('Notifications'),
        ),

        const Card(
          child: ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('English'),
          ),
        ),

        const Card(
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Version'),
            subtitle: Text('2.0.0'),
          ),
        )
      ],
    );
  }
}
