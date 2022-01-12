import 'package:flutter/material.dart';

dynamic parseAppBarJson(Map<String, dynamic> json, context) {
  return PreferredSize(
    child: AppBar(
      title: json.containsKey('title') ? Text(json['title']) : null,
      elevation: json.containsKey('elevation') ? json['elevation'] : 0.0,
      leading: json.containsKey('leading')
          ? IconButton(
              onPressed: () {
                print('CALLING:${json['leading']['on_pressed']}');
              },
              icon: Icon(
                IconData(
                  json['leading']['icon_data']['codePoint'],
                  fontFamily: json['leading']['icon_data']['fontFamily'],
                ),
              ),
            )
          : null,
    ),
    preferredSize: Size(
      MediaQuery.of(context).size.width,
      55,
    ),
  );
}

Widget parseBody(Map<String, dynamic> json, context) {
  if (json['type'] == 'stack') {
    return Stack(
      children: [
        ...(json['children'] as List).map((e) {
          if (e['type'] == 'align') {
            return parseAlign(e, context);
          } else {
            return Container();
          }
        }).toList(),
      ],
    );
  } else {
    return Container();
  }
}

Align parseAlign(Map<String, dynamic> json, context) {
  return Align(
    alignment: json['attributes']['alignment'] == 'top_center'
        ? Alignment.topCenter
        : json['attributes']['alignment'] == 'bottom_center'
            ? Alignment.bottomCenter
            : Alignment.center,
    child: json['child']['type'] == 'text'
        ? parseText(json['child'], context)
        : Container(),
  );
}

Text parseText(Map<String, dynamic> json, context) {
  return Text(
    json['attributes']['text'],
  );
}
