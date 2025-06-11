import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

AppBar ProfileAppBar(BuildContext context) {
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
              TextString: "Profile",
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
            ReusableText(
              FromTop: 5,
              FromLeft: 15,
              TextString: "Manage your account",
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

Widget profileReusableContainer({
  required BuildContext context,
  required bool isNotification,
  required String title,
  required IconData icon,
  int? notificationNumber,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(width: 30,),
          Expanded(
            child: ReusableText(
              FromBottom: 0,
              TextString: title,
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Row(
            children: [
              isNotification
                  ? Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: ReusableText(
                          FromTop: 0,
                          FromBottom: 0,
                          FromLeft: 0,
                          FromRight: 0,
                          TextString: "$notificationNumber",
                          FontSize: 18,
                          TextFontWeight: FontWeight.w900,
                          TextColor: Colors.white,
                        ),
                      ),
                    )
                  : SizedBox(),
              Icon(
                Icons.keyboard_arrow_right_sharp,
                size: 30,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
