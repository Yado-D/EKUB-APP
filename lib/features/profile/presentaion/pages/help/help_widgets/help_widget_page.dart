import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar helpAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 30,
          ),
        ),
        ReusableText(
          FromTop: 0,
          FromBottom: 0,
          TextString: "Help & Support",
          FontSize: 22,
          TextFontWeight: FontWeight.w900,
          TextColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    ),
  );
}

Widget helpReusableContainer({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: title,
                  FontSize: 18,
                  TextFontWeight: FontWeight.w900,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: subtitle,
                  FontSize: 18,
                  TextFontWeight: FontWeight.w500,
                  TextColor: Colors.grey.shade700,
                ),
              ],
            ),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right_sharp,
          size: 30,
        ),
      ],
    ),
  );
}

Widget reusableSliceContainer() {
  return Container(
    width: double.infinity,
    height: 2,
    color: Colors.grey.shade100,
  );
}
