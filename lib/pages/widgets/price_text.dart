import 'package:flutter/material.dart';

import '../../style/ui.dart';

class PriceText extends StatelessWidget {
  const PriceText({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: UI.textStyle,
        children: <TextSpan>[
          TextSpan(text: title),
          TextSpan(
            text: value,
            style: title == 'Balance: ' ? UI.greenValueStyle : UI.redValueStyle,
          )
        ],
      ),
    );
  }
}
