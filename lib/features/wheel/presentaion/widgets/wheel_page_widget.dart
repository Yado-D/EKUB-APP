import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

AppBar wheelAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 15,
              FromBottom: 0,
              FromLeft: 15,
              TextString: "Wheel",
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
            ReusableText(
              FromTop: 5,
              FromLeft: 15,
              TextString: "Spin the Wheel",
              FontSize: 16,
              TextFontWeight: FontWeight.w600,
              TextColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ],
    ),
  );
}
