import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

AppBar notificationsAppBar(BuildContext context) {
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
          TextString: "Notifications",
          FontSize: 22,
          TextFontWeight: FontWeight.w900,
          TextColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    ),
  );
}

Widget notificationReusableContainer({
  required BuildContext context,
  required String title,
  required String subtitle,
  required bool value,
  required Function(bool) switchClicked,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
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
                Container(
                  width: 260,
                  child: ReusableTextWithLongText(
                    FromTop: 0,
                    FromBottom: 0,
                    TextString: subtitle,
                    FontSize: 18,
                    TextFontWeight: FontWeight.w500,
                    TextColor: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Switch(
            activeColor: ColorCollections.GreenColor,
            inactiveTrackColor: Colors.green.shade200,
            value: value,
            onChanged: switchClicked,
          ),
        ),
      ],
    ),
  );
}
