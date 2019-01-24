import 'dart:convert'; //json
import 'package:flutter/material.dart';
import 'dart:async';

Future<Map<String, dynamic>> loadJsonFileAsMap(
    BuildContext context, String assetPath) async {
  String messageDetailsString =
      await DefaultAssetBundle.of(context).loadString(assetPath);
  Map<String, dynamic> mappedMessages = json.decode(messageDetailsString);
  print('mappedMsgs $mappedMessages');
  // List<dynamic> messages = mappedMessages['123']['messages'];

  return mappedMessages;
}
