import 'package:flutter/material.dart';
import 'package:sdui_demo/appbar_parser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialScreen(),
    );
  }
}

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Map<String, dynamic> json = {
    'app_bar': {
      'title': 'HELLO BROTHER!',
      'elevation': 8.0,
      'leading': {
        'icon_data': {
          "iconName": "ac_unit",
          "codePoint": 60219,
          "fontFamily": "MaterialIcons"
        },
        'icon_color': '#000000',
        'on_pressed': 'www.google.com',
      }
    },
    'body': {
      'type': 'stack',
      'children': [
        {
          'type': 'align',
          'child': {
            'type': 'text',
            'attributes': {
              'text': 'THIS IS ALIGN_1 TEXT',
            },
          },
          'attributes': {
            'alignment': 'top_center',
          },
        },
        {
          'type': 'align',
          'child': {
            'type': 'text',
            'attributes': {
              'text': 'THIS IS ALIGN_2 TEXT',
            },
          },
          'attributes': {
            'alignment': 'bottom_center',
          },
        },
        {
          'type': 'align',
          'child': {
            'type': 'text',
            'attributes': {
              'text': 'THIS IS ALIGN_3 TEXT',
            },
          },
          'attributes': {
            'alignment': 'center',
          },
        },
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: parseAppBarJson(json['app_bar']!, context),
      body: json.containsKey('body') ? parseBody(json['body'], context) : null,
    );
  }
}
