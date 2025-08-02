import 'dart:ui' as ui;

import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  final String _language = ui.window.locale.languageCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.language, color: Colors.white, size: 20),
        SizedBox(width: UIConstants.smallSize),
        Text(
          "Language: $_language",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
